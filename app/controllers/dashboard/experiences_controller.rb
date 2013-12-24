class Dashboard::ExperiencesController < Dashboard::ApplicationController
  def index
  end

  def new
    @experience = Experience.new
    render :layout => false
  end

  def show
  end

  def template
    @templates = Experience.where(:template => true)
  end
end
