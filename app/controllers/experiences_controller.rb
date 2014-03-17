require 'temboo'
require 'Library/Facebook'

class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_filter :check_if_host, only: [:create]

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @attendee = Attendee.new
    @message = Message.new
    @advance_booking = AdvanceBooking.new
    @header_images = ExperienceImage.where(:random_id => @experience.random_id).first(3)
    @images =ExperienceImage.where(:experience_id=> @experience.id)
    @host = Host.where(:user_id => @experience.user_id).first
    dates_hash = ExperienceDate.where(:experience_id => @experience.id).pluck(:experience_date)
    @dates_array = []
    @reviews = Review.find_by_experience_id(@experience.id)

    dates_hash.each do |experience_date_item|
      @dates_array << experience_date_item.strftime("%Y-%m-%d").to_s
    end

    impressionist(@experience)
    render layout: false
  end

  # POST /experiences
  # POST /experiences.json
  def create

    #@experience = Experience.new(experience_params)
    
    @experience = Experience.new(experience_params)
    @experience.user_id = current_user.id
    images = params[:experience][:images].split(',')

    case params[:experience][:category]
      when 1
        @experience.category = "City Tour"
      when 2
        @experience.category = "Hobby Class"
      when 3
        @experience.category = "Adventure Activity"
      else
        logger.debug "No field selected"
    end


    fbCheckToken = IntegrationToken.where(:user_id => current_user.id).where(:provider => 'Facebook').first
    if fbCheckToken.blank?
      postToFBWall = false  
    else
      postToFBWall = fbCheckToken.post_to_fb_wall
    end    
    
      
    if postToFBWall == true
        token = fbCheckToken.token    
        
        # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
      session = TembooSession.new("urbanzeak", 'socialMediaIntegration', '24583a5a-0098-4660-9')
        logger.debug "Tje session is: #{session}"
      postChoreo = Facebook::Publishing::Post.new(session)

      # Get an InputSet object for the choreo
      postInputs = postChoreo.new_input_set()

      # Set inputs
      postInputs.set_AccessToken(token);
      postInputs.set_Message("This is a test message from UrbanZeak");

      # Execute Choreo
      postResults = postChoreo.execute(postInputs)
        
    end
         
    respond_to do |format|
      if @experience.save
        experience_dates = params[:experience][:exp_date].split(',')

        experience_dates.each do |experience_date|
          @experience_date = ExperienceDate.new
          @experience_date.experience_date =  Date.strptime(experience_date.to_s, '%m/%d/%Y')
          @experience_date.experience_id = @experience.id
          @experience_date.save
        end

        images.each do |image|
          exp_image = ExperienceImage.new
          logger.debug "The image in the loop is #{image}"
          exp_image.image = image
          exp_image.experience_id = @experience.id
          exp_image.save
        end

        url = Shortener::ShortenedUrl.generate(experience_url(@experience), current_user)
          
        @experience.shortened_url = root_url + url.unique_key + '/'
        @experience.save
          
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render action: 'show', status: :created, location: @experience }
      else
        format.html { render action: 'new' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # Getting available dates
  def available_dates
    experience = Experience.find(params[:experience_id])
    attendees = Attendee.where(:experience_id => experience.id)

    experience_dates = ExperienceDate.where(:experience_id => experience.id)
    available_dates = []
    experience_dates.each do |experience_date|
      logger.debug "The experience date is: #{experience_date.experience_date}"
      dates_with_attendees = attendees.where(:attending_date => experience_date.experience_date).pluck(:seats).sum
      logger.debug "The values in the dates_with_attendees is: #{dates_with_attendees}"
      logger.debug "The params seats is: #{params[:seats_required].to_i}"
      logger.debug "The max seats are: #{experience.max_seats}"
      logger.debug "The seats subtracted are: #{dates_with_attendees - params[:seats_required].to_i}"

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
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      #params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, exp_images_attributes: [:url])
      params.require(:experience).permit(:name, :description, :price, :things_to_remember, :line_one, :line_two, :state, :city, :land_mark, :country, :exp_date, :exp_time, :template_id, :random_id, :pincode, :latitude, :longitude, :tagline, :what_does_this_include, :max_seats, :category)
    end

    def review_params
      #params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, exp_images_attributes: [:url])
      params.require(:review).permit(:name, :email, :comment, :experience_id)
    end


end
