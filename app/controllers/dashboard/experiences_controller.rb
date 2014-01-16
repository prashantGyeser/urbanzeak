class Dashboard::ExperiencesController < Dashboard::ApplicationController
  def index
      @experiences = Experience.where(:user_id => current_user.id)
  end

  def new
    @experience = Experience.new
    @experience_image = ExperienceImage.new
    
    render :layout => false
  end

  def show
  end

  def template
    @templates = Experience.where(:template => true)
  end
end
