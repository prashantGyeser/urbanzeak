require 'temboo'
require 'Library/Facebook'

class Dashboard::IntegrationsController < Dashboard::ApplicationController
  # FINALIZE_OAUTH_CONTROLLER = "http://localhost:3000/integrations/facebook_finalizeOAuth"

  def index
    # Checking to see if the user already is signed up for the various services available
    fbCheckTokenPresent = IntegrationToken.where(:user_id => current_user.id).where(:provider => 'Facebook')

    if !fbCheckTokenPresent.empty?
      @facebookIntegrationDone = true
    end

  end

  def facebook
    logger.debug "Starting the request to get facebook permission"
    # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
    session = TembooSession.new("urbanzeak", 'socialMediaIntegration', '24583a5a-0098-4660-9')

    initializeOAuthChoreo = Facebook::OAuth::InitializeOAuth.new(session)

    # Get an InputSet object for the choreo
    initializeOAuthInputs = initializeOAuthChoreo.new_input_set()

    # Set inputs
    initializeOAuthInputs.set_AppID("555128847910730")
    logger.debug "Before setting scope"
    initializeOAuthInputs.set_Scope("publish_actions,publish_stream,manage_pages");
    logger.debug "After setting scope"
    initializeOAuthInputs.set_ForwardingURL(dashboard_integrations_facebook_finalizeOAuth_url)
    logger.debug "the finalize path ios: #{dashboard_integrations_facebook_finalizeOAuth_url}"
    # Execute Choreo
    initializeOAuthResults = initializeOAuthChoreo.execute(initializeOAuthInputs)

    @callbackID = initializeOAuthResults.get_CallbackID()
    @authorizationURL = initializeOAuthResults.get_AuthorizationURL()

    cookies[:tembooCallbackID] = @callbackID

    redirect_to @authorizationURL

  end

  def facebook_finalizeOAuth
    logger.debug "Ok it is getting here"

    session = TembooSession.new("urbanzeak", 'socialMediaIntegration', '24583a5a-0098-4660-9')
      
    # Grab the callback ID out of the cookie
    @retrievedCallbackID = cookies[:tembooCallbackID]

    # Instantiate the Choreo, using a previously instantiated TembooSession object,
    finalizeOAuthChoreo = Facebook::OAuth::FinalizeOAuth.new(session)

    # Get an InputSet object for the choreo
    finalizeOAuthInputs = finalizeOAuthChoreo.new_input_set()

    # Set inputs
    finalizeOAuthInputs.set_CallbackID(@retrievedCallbackID)
    finalizeOAuthInputs.set_AppSecret("67e4d163ed22eaf2464a88f9b488e6aa")
    finalizeOAuthInputs.set_AppID("555128847910730")



    # Execute Choreo
    finalizeOAuthResults = finalizeOAuthChoreo.execute(finalizeOAuthInputs)

    # Get the Facebook access token
    @accessToken = finalizeOAuthResults.get_AccessToken();

    # Store the access token in a cookie, for reuse
    cookies[:facebookAccessToken] = @accessToken

    # Storing the access token in the database
    userId = current_user.id
    @tokens = IntegrationToken.create(token: @accessToken,provider: 'Facebook', user_id: userId)

    flash[:notice] = 'Facebook integration successfully added.'
    redirect_to dashboard_integrations_path

  end

  def postToFacebook
    logger.debug "It is getting to the fb post function"
    if cookies[:facebookAccessToken]
      token = cookies[:facebookAccessToken]

      # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
      session = TembooSession.new("urbanzeak", ENV["TEMBOO_APP_KEY_NAME"], ENV["TEMBOO_APP_KEY_VALUE"])
      postChoreo = Facebook::Publishing::Post.new(session)

      # Get an InputSet object for the choreo
      postInputs = postChoreo.new_input_set()

      # Set inputs
      postInputs.set_AccessToken(token);
      postInputs.set_Message("This is a test message from UrbanZeak");

      # Execute Choreo
      postResults = postChoreo.execute(postInputs)
    else
      integrationUser = IntegrationToken.where(:user_id => current_user.id).where(:provider => 'Facebook').first
      token = integrationUser.token
    end
  end
    
    
    def setConfig
        @fbCheckToken = IntegrationToken.where(:user_id => current_user.id).where(:provider => 'Facebook').first
        
        if params[:post] == 'false'
            @fbCheckToken.post_to_fb_wall = false   
        else
            @fbCheckToken.post_to_fb_wall = true
        end
        
        respond_to do |format|
          if @fbCheckToken.save
            format.json { head :no_content }
          else
            format.json { render json: @fbCheckToken.errors, status: :unprocessable_entity }
          end
        end
        
        
    end
    
end

