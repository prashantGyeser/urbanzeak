class Api::V1::ApplicationController < ApplicationController
	respond_to :json

	helper_method :current_user

    protected
        def current_user
            @_current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
        end
end