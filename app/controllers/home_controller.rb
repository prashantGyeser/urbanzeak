class HomeController < ApplicationController
  def index
    logger.debug "Woohoo! the request works #{request.ip}"
    if request.ip == '127.0.0.1'
      @experiences = Experience.first(10)
    else
      @experiences = Experience.where("city like ?", "%#{request.location.country}%")
      @country = request.location.country
    end

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { head :no_content }
    end
  end
end
