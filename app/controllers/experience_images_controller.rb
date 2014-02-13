class ExperienceImagesController < ApplicationController
  before_action :set_experience_image, only: [:show, :edit, :update, :destroy]

  # GET /experience_images
  # GET /experience_images.json
  def index
    @experience_images = ExperienceImage.all
  end

  # GET /experience_images/1
  # GET /experience_images/1.json
  def show
  end

  # GET /experience_images/new
  def new
    @experience_image = ExperienceImage.new
  end

  # GET /experience_images/1/edit
  def edit
  end

  # POST /experience_images
  # POST /experience_images.json
  def create
    #@experience_image = ExperienceImage.new(experience_image_params)
    logger.debug "The params coming in are:#{params.inspect}"
    @experience_image = ExperienceImage.new(experience_image_params)
    logger.debug "The file created is: #{@experience_image.inspect}"


    respond_to do |format|
      if @experience_image.save
        format.json{ render :json => @experience_image }
      else
        format.json { render json: @experience_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_images/1
  # PATCH/PUT /experience_images/1.json
  def update
    respond_to do |format|
      if @experience_image.update(experience_image_params)
        format.html { redirect_to @experience_image, notice: 'Experience image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @experience_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_images/1
  # DELETE /experience_images/1.json
  def destroy
    @experience_image.destroy
    respond_to do |format|
      format.html { redirect_to experience_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience_image
      @experience_image = ExperienceImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_image_params
      params.require(:experience_image).permit(:image, :experience_id, :image_type, :random_id)
    end
end
