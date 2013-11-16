class Api::V1::RegistrationsController < Devise::RegistrationsController
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def create
		user = User.new(user_params)

		if user.save
			render json: user, status: :created
		else
	      	respond_with user
	    	end
	end
  	

	def user_params
		logger.debug "It is getting here"
	  params.require(:user).permit(:email, :password, :salt, :encrypted_password)
	end

end