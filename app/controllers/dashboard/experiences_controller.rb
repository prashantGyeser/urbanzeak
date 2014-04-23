require 'securerandom'
require 'temboo'
require 'Library/Facebook'

class Dashboard::ExperiencesController < Dashboard::ApplicationController
  def index
    @experiences = Experience.where(:user_id => current_user.id)
    @about = Host.where(:user_id => current_user.id)
  end

  def new
    @experience = Experience.new
    @experience_image = ExperienceImage.new
    @random_temp_experience_id = SecureRandom.hex(15)
    #@template_id = params[:template_id]
    #render :layout => false
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
      @available_dates << (experience_date.experience_date.strftime("%m/%d/%Y").to_s)
    end
    #@experience.exp_date = @available_dates
    @experience.exp_date = @available_dates.map(&:inspect).join(', ')
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
      logger.debug "Tje session is: #{session}"
      postChoreo = Facebook::Publishing::Post.new(session)

      # Get an InputSet object for the choreo
      postInputs = postChoreo.new_input_set()

      # Constructing message to post
      message_to_post = "Come join us for a great experience: #{experience.name} by going to http://#{current_user.subdomain}.urbanzeak.com/#{experience.slug} "

      # Set inputs
      postInputs.set_AccessToken(token);
      postInputs.set_Message(message_to_post);

      # Execute Choreo
      @postResults = postChoreo.execute(postInputs)

    end

    respond_to do |format|

      if no_token == false
        logger.debug "Ok it is getting here"
        format.json { render :json => {:message => "Successfully posted"}, status: :created}
      else
        logger.debug "Ok it is getting here"
        format.json { render :json => {:error => "no tokens"}.to_json, status: :unprocessable_entity, :message => "No tokens found"}
      end


    end
  end


end
