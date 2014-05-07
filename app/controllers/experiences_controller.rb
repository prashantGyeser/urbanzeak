require 'temboo'
require 'Library/Facebook'

class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_filter :check_if_host, only: [:create]


  def index
    host = User.find_by_subdomain(request.subdomain)
    @experiences = Experience.where(:user_id => host.id)

    if @experiences.count == 1
      #url_to_redirect_to = request.subdomain + '.' + request.domain + request.port_string +experiences_path(@experiences)
      redirect_to experience_path(@experiences.first)
    end
    
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @attendee = Attendee.new
    @message = Message.new
    @images =ExperienceImage.where(:experience_id=> @experience.id)
    @host = Host.where(:user_id => @experience.user_id).first
    @reviews = Review.where(:experience_id => @experience.id).where(:show => true).limit(3)
    @available_dates = @experience.available_dates(params[:seats].to_i)

    impressionist(@experience)
    render layout: false
  end

  # Getting available dates
  def available_dates
    experience = Experience.find(params[:experience_id])
    attendees = Attendee.where(:experience_id => experience.id)

    experience_dates = ExperienceDate.where(:experience_id => experience.id)
    available_dates = []
    experience_dates.each do |experience_date|
      dates_with_attendees = attendees.where(:attending_date => experience_date.experience_date).pluck(:seats).sum


      if (dates_with_attendees + params[:seats_required].to_i) < experience.max_seats
        available_dates << experience_date.experience_date.strftime("%Y-%m-%d").to_s
      end

    end
    logger.debug "The vailable dates are: #{available_dates}"

    respond_to do |format|
      format.json{ render :json => available_dates }
    end
  end


  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
    end
  end

  def create_review

    #@review = Review.new(review_params)
    @review = Review.new(review_params)
    logger.debug "The params are: #{params.inspect}"
    respond_to do |format|
      if @review.save
        logger.debug "It is getting to the save"
        #format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.json { render json: @review }
      else
        logger.debug "It is getting to the error"
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def check_if_host
    if signed_in?
      raise 'Only hosts can create experiences!' unless current_user.host?
    else
      # or you can use the authenticate_user! devise provides to only allow signed_in users
      raise 'Please sign in!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      #params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, exp_images_attributes: [:url])
      params.require(:experience).permit(:name, :description, :price, :things_to_remember, :line_one, :line_two, :state, :city, :land_mark, :country, :exp_date, :exp_time, :template_id, :random_id, :pincode, :latitude, :longitude, :tagline, :what_does_this_include, :max_seats, :category, :hours, :experience_image_attributes => [:id, :image])
    end

    def review_params
      #params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, exp_images_attributes: [:url])
      params.require(:review).permit(:name, :email, :comment, :experience_id)
    end


end
