class HomeController < ApplicationController
  def index

    if request.ip == '127.0.0.1'
      #@experiences = Experience.first(10)
      @experiences = Experience.all
    else
      location = Geocoder.search(request.ip)
      @experiences = Experience.where("city like ?", "%#{location[0].country}%")

      @country = request.location.country

      if @experiences.empty?
        @experiences = Experience.first(9)
      end

    end

    if params[:city].nil?
      @experiences = Experience.all
    else
      @experiences = Experience.where("city like ?", "%#{params[:city]}%")
    end

    #@experiences = @experiences.in_groups_of(3)

    logger.debug "The content in the expereinces array is: #{@experiences.inspect}"


    respond_to do |format|
      format.html { render action: 'index' }
      format.json { head :no_content }
    end
  end
end

