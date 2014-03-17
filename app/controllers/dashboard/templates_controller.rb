class Dashboard::TemplatesController < Dashboard::ApplicationController
  def index
  	@templates = Template.where(:user_id => current_user.id)
  end

  def new
  	@template = Template.new
  	@experience_image = ExperienceImage.new
    @random_temp_experience_id = SecureRandom.hex(15)
  	render :layout => false
  end

  def create
    @template = Template.new(template_params)
    @template.user_id = current_user.id
    
    #images = ExperienceImage.where(:random_id => @experience.random_id)    

    #images.each do |image|
      #image.experience_id = @experience.id
      #image.save
    #end
          
    respond_to do |format|
      if @template.save
        format.html { redirect_to dashboard_template_path(@template), notice: 'Template was successfully created.' }
        format.json { render action: 'show', status: :created, location: @template }
      else
        format.html { render action: 'new' }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @template = Template.find(params[:id])
    @header_images = ExperienceImage.where(:random_id => @template.random_id)
    render :layout => false
  end

  private

  def template_params
      #params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, exp_images_attributes: [:url])
      params.require(:template).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, :image, :what_does_it_include, :things_to_remember, :max_seats, :template, :landmark, :country, :line_one, :line_two, :state, :zipcode, :random_id )
    end

end
