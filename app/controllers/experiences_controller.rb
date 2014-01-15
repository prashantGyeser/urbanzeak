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
    impressionist(@experience)
    render layout: false
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.user_id = current_user.id
    
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

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
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
      params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, :image, :what_does_this_include, :things_to_remember, :max_seats, :template )
    end
end
