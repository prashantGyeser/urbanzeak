require 'securerandom'

class Dashboard::ExperiencesController < Dashboard::ApplicationController
  def index
      @experiences = Experience.where(:user_id => current_user.id)
  end

  def new

    if params[:experience_id]
      dulicate_from = Experience.find(params[:experience_id])      
      # Getting the attributes to use to create a new experience record
      @experience = Experience.new(dulicate_from.attributes)
      @experience_image = ExperienceImage.new
    else
      @experience = Experience.new
      @experience_image = ExperienceImage.new
      @random_temp_experience_id = SecureRandom.hex(15)
      #@template_id = params[:template_id]  
    end

    
    render :layout => false
  end

  def show
  end

  def template
    @templates = Experience.where(:template => true)
  end
end
