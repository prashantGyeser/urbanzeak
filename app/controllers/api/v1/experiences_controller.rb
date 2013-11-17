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
				@experience = Experience.create(params(experience_params))
				respond_with @experience
			end

			def update
				respond_with Experience.update(params[:id], params[:product])
			end

			def destroy
				respond_with Experience.destroy(params[:id])
			end

			private
			# Strong params, taken from http://stackoverflow.com/questions/17371334/how-is-attr-accessible-used-in-rails-4
			def experience_params
				params.require(:experience).permit(:name, :description, :price, :venue, :city, :experience_date, :experience_time, experience_images_attributes: [:name, :url])
			end

		end
	end
end
