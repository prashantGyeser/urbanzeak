class Dashboard::ExperiencesController < Dashboard::ApplicationController
  def index
  end

  def new
    @experience = Experience.new
    render :layout => false
  end

  def show
  end
end
