class Api::V1::ApplicationController < ApplicationController
	respond_to :json
	before_filter :configure_devise_params, if: :devise_controller?
		def configure_devise_params
		  devise_parameter_sanitizer.for(:sign_up) do |u|
		    u.permit(:email, :password, :password_confirmation)
		  end
		end

end