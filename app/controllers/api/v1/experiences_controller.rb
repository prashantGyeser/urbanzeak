class Api::V1::ExperiencesController < Api::V1::ApplicationController
	respond_to :json

	def index
		respond_with Experience.all
	end

	def show
		logger.debug "It is getting here"
		respond_with Experience.find(params[:id])
	end

	def create
		#@experience = Experience.create(experience_params)
		#@experience_with_images = @experience.build_images()
		#logger.debug "The params for the images are: #{params[:images]}"
		logger.debug "The description not getting stored is: #{params[:experience][:description]}"
		@experience = Experience.new()
		@experience.name = params[:experience][:name]
		@experience.description = params[:experience][:description]
		@experience.experience_date = params[:experience][:experience_date]
		@experience.experience_time = params[:experience][:experience_time]
		@experience.price = params[:experience][:price]
		@experience.venue = params[:experience][:venue]
		@experience.city = params[:experience][:city]
		logger.debug "The expperience is: #{@experience}"
		images = params[:experience][:images]


		if @experience.save
			images.each do |image|
				@image = Image.new(image)
				@image.experience_id = @experience.id
				@image.save
			end
			render json: @experience	
		else

		end
		
		
	end

	def update
		respond_with Experience.update(params[:id], params[:product])
	end

	def destroy
		respond_with Experience.destroy(params[:id])
	end

	def images
		logger.debug "The params are: #{params}"
		exprience_images = Image.where(:experience_id => params[:experience_id])
		respond_with exprience_images
	end

	private
	# Strong params, taken from http://stackoverflow.com/questions/17371334/how-is-attr-accessible-used-in-rails-4
	def experience_params
		params.require(:experience).permit(:name, :description, :price, :venue, :city, :experience_date, :experience_time,images: [:id, :filename, :url, :key, :experience_id, :isWriteable, :mimetype, :size, :container])
		#params.require(:experience).permit!
	end

	def image_params
		params.require(:images).permit(:filename, :url, :key, :experience_id)
	end

end
