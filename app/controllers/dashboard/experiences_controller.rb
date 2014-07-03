require 'securerandom'
require 'temboo'
require 'Library/Facebook'

class Dashboard::ExperiencesController < Dashboard::ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_filter :check_if_host, only: [:create]
  skip_before_filter :verify_authenticity_token, :only => [:create, :edit]

  def index
    @experiences = Experience.where(:user_id => current_user.id)
    @about = Host.where(:user_id => current_user.id)
    @integration_tokens = IntegrationToken.where(:user_id => current_user.id)
  end

  # POST /experiences
  # POST /experiences.json
  def create

    #@experience = Experience.new(experience_params)
    @experience = Experience.new(experience_params)
    @experience.user_id = current_user.id
    #images_string = params[:experience][:images]
    images = params[:experience_image][:image]

    if images.blank?
    else
      experience_images = JSON.parse(params[:experience_image][:image])
    end


    respond_to do |format|
      if @experience.save
        experience_dates = params[:experience][:exp_date].split(',')

        if experience_images.present?
          experience_images.each do |experience_image|
            ExperienceImage.create!(:experience_id => @experience.id, :url => experience_image["url"], :file_name => experience_image["filename"])
          end
        end

        experience_dates.each do |experience_date|
          @experience_date = ExperienceDate.new
          @experience_date.experience_date =  Date.strptime(experience_date.to_s, '%m/%d/%Y')
          @experience_date.experience_time = Time.zone.parse(params[:experience][:exp_time])
          @experience_date.experience_id = @experience.id
          @experience_date.save
        end



        url = Shortener::ShortenedUrl.generate(experience_url(@experience), current_user)

        @experience.shortened_url = root_url + url.unique_key + '/'
        @experience.save

        @newly_created = true

        # Setting an intercom event to let us track if a user has created an experience or not
        if ENV['RAILS_ENV'].to_s == 'production'

        else
          Intercom.app_id = "5suewg1k"
          Intercom.app_api_key = "64d529cfdec7dc91ee99a2d156afee801ed50b6c"
        end
        intercom_results = Intercom::Event.create(:event_name => "created-event", :email => current_user.email, :created_at => Time.now.to_i)
        logger.debug "The result is: #{intercom_results}"


        format.html { redirect_to experience_url(@experience, :subdomain => current_user.subdomain, :newly_created => true), notice: 'Experience was successfully created.', status: 301 }
        format.json { render action: 'show', status: :created, location: @experience }
      else
        format.html { render action: 'new' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @newly_created = false
    experience_dates = params[:experience][:exp_date].split(',')
    logger.debug "The experience dates are: #{experience_dates.inspect}"
    images = params[:experience_image][:image]
    logger.debug "The images are: #{images}"
    if images.blank?
    else
      experience_images = JSON.parse(params[:experience_image][:image])
    end

    logger.debug "The experience_images are: #{experience_images}"

    previous_dates = ExperienceDate.where(:experience_id => @experience.id)
    previous_images = ExperienceImage.where(:experience_id => @experience.id)


    if experience_dates.blank?

    else

      prev_date_count = previous_dates.count

      previous_dates.each do |prev_date|
        prev_date.destroy
      end

      experience_dates.each do |experience_date|
        #if experience_dates.count == prev_date_count
        @experience_date = ExperienceDate.new
        @experience_date.experience_date =  Date.strptime(experience_date.to_s, '%m/%d/%Y')
        @experience_date.experience_time = Time.zone.parse(params[:experience][:exp_time])
        @experience_date.experience_id = @experience.id
        @experience_date.save
      end
    end
    #logger.debug "the images are blank: #{imageasas.blank?}"

    if previous_images.blank?
    else
      previous_images.each do |previous_image|
        previous_image.destroy
      end
    end


    if experience_images.present?
      experience_images.each do |experience_image|
        ExperienceImage.create!(:experience_id => @experience.id, :url => experience_image["url"], :file_name => experience_image["filename"])
      end
    end

    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience, :subdomain => current_user.subdomain), notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render :controller => 'dashboard/experiences' ,action: 'edit' }
        format.html { render action: 'edit' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @experience = Experience.new
    @experience_image = ExperienceImage.new
    @random_temp_experience_id = SecureRandom.hex(15)
    #@template_id = params[:template_id]
    #render :layout => false
    @experience.experience_images.build
  end

  def show
  end

  def edit
    @available_dates = []
    @experience = Experience.find(params[:id])
    experience_dates = ExperienceDate.where(:experience_id => @experience.id)
    total_number_of_dates = experience_dates.count
    counter = 0
    experience_dates.each do |experience_date|
      #@available_dates << (experience_date.experience_date.strftime("%Y/%m/%d").to_s)
      #@available_dates << (experience_date.experience_date.to_datetime.to_s)
      #@available_dates << (Time.parse(experience_date.experience_date))
      @available_dates << (experience_date.experience_date.to_datetime.to_i)
    end
    #@experience.exp_date = @available_dates
    if @available_dates.blank?
      
    else
      @experience.exp_date = @available_dates.map(&:inspect).join(', ')
    end
    @experience.exp_time = @experience.exp_time.strftime("%I:%M %p") #"7:15 PM"
    @experience_images = ExperienceImage.where(:experience_id => @experience.id)
  end

  def remove_photos
    logger.debug "The params are: #{params.inspect}"

    experience_images = ExperienceImage.where(:experience_id => params[:experience_id])
    experience_images.each do |experience_image|
      experience_image.destroy
    end


    respond_to do |format|
      format.json { render json: experience_images}
    end
  end

  def template
    @templates = Experience.where(:template => true)
  end

  def facebook_share

    experience = Experience.find(params[:experience_id])

    fbCheckToken = IntegrationToken.where(:user_id => current_user.id).where(:provider => 'Facebook').first
    if fbCheckToken.blank?
      postToFBWall = false
      no_token = true
    else
      no_token = false
      postToFBWall = fbCheckToken.post_to_fb_wall
      token = fbCheckToken.token

      # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
      session = TembooSession.new("urbanzeak", 'socialMediaIntegration', '24583a5a-0098-4660-9')
      postChoreo = Facebook::Publishing::PublishLink.new(session)

      # Get an InputSet object for the choreo
      postInputs = postChoreo.new_input_set()

      # Constructing message to post
      message_to_post = "Come join us for a great experience: #{experience.name} by going to http://#{current_user.subdomain}.urbanzeak.com/experiences/#{experience.slug} "

      # Set inputs
      postInputs.set_AccessToken(token);
      postInputs.set_Message(message_to_post);
      postInputs.set_Link("http://#{current_user.subdomain}.urbanzeak.com/experiences/#{experience.slug}");

      # Execute Choreo
      @postResults = postChoreo.execute(postInputs)

    end

    respond_to do |format|

      if no_token == false
        format.json { render :json => {:message => "Successfully posted"}, status: :created}
      else
        format.json { render :json => {:error => "no tokens"}.to_json, status: :unprocessable_entity, :message => "No tokens found"}
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

  def experience_params
    #params.require(:experience).permit(:name, :description, :price, :exp_date, :exp_time, :latitude, :longitude, :city, exp_images_attributes: [:url])
    params.require(:experience).permit(:name, :description, :price, :things_to_remember, :line_one, :line_two, :state, :city, :land_mark, :country, :exp_date, :exp_time, :template_id, :random_id, :pincode, :latitude, :longitude, :tagline, :what_does_this_include, :max_seats, :category, :hours, :experience_image_attributes => [:id, :image])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience = Experience.friendly.find(params[:id])
  end

end
