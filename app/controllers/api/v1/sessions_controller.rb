class Api::V1::SessionsController < DeviseController #Api::V1::ApplicationController
  respond_to :json
  prepend_before_filter :require_no_authentication, :only => [:create, :destroy, :failure]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter :only => [ :create, :destroy ] { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    current_user = User.where(:email => params[:user][:email])
    if current_user
      resource = warden.authenticate(:scope => resource_name, :recall => "#{controller_path}#failure")
      render :status => 200,
             :json => { :success => true,
                        :info => "Logged in",
                        :user => current_user
             }
    else
      render :status => 401,
             :json => { :success => false,
                        :info => "Failed to log in. Either your email or password is wrong",
             }
    end
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    yield resource if block_given?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Credentials Failed"
           }
  end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#failure" }
  end
  
end