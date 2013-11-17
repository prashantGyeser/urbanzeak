class Api::V1::SessionsController < DeviseController #Api::V1::ApplicationController
  respond_to :json
  prepend_before_filter :require_no_authentication, :only => [:create, :destroy, :failure]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter :only => [ :create, :destroy ] { request.env["devise.skip_timeout"] = true }
  
  # POST /resource/sign_in
  def create
    # Code taken from http://stackoverflow.com/questions/16427615/rails-devise-with-regular-authorization-and-api
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    logger.debug "It gets past the resource call to db auth: #{resource.inspect}"
    
    if resource.nil?
      render :status => 401,
           :json => { :success => false,
                      :info => "Login Credentials Failed"
           }
    else
      if resource.valid_password?(params[:user][:password])
        logger.debug "The value before the if statement is: #{((sign_in(:user, resource)) == true)}"
        if ((sign_in(:user, resource))  == true)
          logger.debug "It is getting here with the value: #{sign_in(:user, resource)}"
          logged_in_user = resource
        else
          logger.debug "It into the else is getting here with the value: #{sign_in(:user, resource)}"
          logged_in_user = sign_in(:user, resource)  
        end
        dataToSendBack = Hash.new
        dataToSendBack[:email] = logged_in_user.email
        logger.debug "tje cpomtent in the dataToSendBack var = #{dataToSendBack.inspect}"
        render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :user => dataToSendBack
           }
      else
        render :status => 401,
           :json => { :success => false,
                      :info => "Login Credentials Failed"
           }
      end
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