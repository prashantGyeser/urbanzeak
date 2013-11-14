module Api
	module V1
		class ExperiencesController < ApplicationController
			respond_to :json

			def index
				respond_with Experience.all
			end

			def show
				respond_with Experience.find(params[:id])
			end

			def create
				respond_with Experience.create(params[:experience])
			end

			def update
				respond_with Experience.update(params[:id], params[:product])
			end

			def destroy
				respond_with Experience.destroy(params[:id])
			end

		end
	end
end
