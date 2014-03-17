require 'securerandom'

class Dashboard::ExperiencesController < Dashboard::ApplicationController
  def index
      @experiences = Experience.where(:user_id => current_user.id)
  end

  def new
    @experience = Experience.new
    @experience_image = ExperienceImage.new
    @random_temp_experience_id = SecureRandom.hex(15)
    #@template_id = params[:template_id]
    #render :layout => false
  end

  def show
  end

  def template
    @templates = Experience.where(:template => true)
  end
end
