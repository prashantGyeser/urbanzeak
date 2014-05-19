require 'temboo'
require 'Library/Facebook'
require 'facebook_oauth'

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

    authorizationURL, callbackId = Auth.initialize_auth(dashboard_integrations_facebook_finalizeOAuth_url)

    cookies[:tembooCallbackID] = callbackId
    redirect_to authorizationURL
  end

  def facebook_finalizeOAuth
    logger.debug "Ok it is getting here"
    callbackId = cookies[:tembooCallbackID]
    accessToken = Auth.finalize_auth(callbackId)
    # Store the access token in a cookie, for reuse
    cookies[:facebookAccessToken] = accessToken

    # Storing the access token in the database
    userId = current_user.id
    @tokens = IntegrationToken.create(token: accessToken,provider: 'Facebook', user_id: userId)

    flash[:notice] = 'Facebook connection successfully added.'
    redirect_to dashboard_integrations_path

  end

  def postToFacebook

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

  def twitter

  end

  def twitter_finalizeOAuth
    authorizationURL, callbackId = TwitterAuth.initialize_auth(dashboard_integrations_facebook_finalizeOAuth_url)

    cookies[:tembooCallbackID] = callbackId
    redirect_to authorizationURL
  end

    
end

