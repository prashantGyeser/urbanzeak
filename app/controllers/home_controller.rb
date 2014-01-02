class HomeController < ApplicationController
  def index
    @experiences = Experience.all

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { head :no_content }
    end
  end
end

