class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout

  protected

  def after_resetting_password_path_for(resource)
    logger.debug "hdskfhds #{dnmslfsd}"
    root_path
  end

  def layout
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
