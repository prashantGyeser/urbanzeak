class Api::V1::LoggedUserController < Api::V1::ApplicationController
	respond_to :json

	def user
		logger.debug "It is getting here"
		logger.debug "The current user is: #{current_api_v1_user}"
		test = "hello"
		respond_with test
	end
	

end
