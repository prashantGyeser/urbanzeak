class Dashboard::TemplatesController < Dashboard::ApplicationController
  def index
  	@templates = Template.where(:user_id => current_user.id)
  end

  def new
  	@template = Template.new
  	@experience_image = ExperienceImage.new

  	render :layout => false
  end

  def create
  end

  def show
  end
end
