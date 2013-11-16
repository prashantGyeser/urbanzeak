class Api::V1::SessionsController < DeviseController #Api::V1::ApplicationController

  prepend_before_filter :require_no_authentication, :only => [:create ]
  #include Devise::Controllers::InternalHelpers
  
  #before_filter :ensure_params_exist
 
  respond_to :json
  
  def create
    respond_to do |format|  
      format.html { super }  
      format.json {  
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")  
        render :status => 200, :json => { :error => "Success" }  
      }  
    end  
  end
  
  def destroy
    sign_out(resource_name)
  end
 
  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end