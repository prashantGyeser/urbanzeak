class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?
  layout :layout

  protected

  def after_resetting_password_path_for(resource)
    root_path
  end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :subdomain, :email, :password, :password_confirmation)
    end
  end

  def layout
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
