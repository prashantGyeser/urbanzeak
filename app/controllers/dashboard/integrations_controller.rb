require 'temboo'
require 'Library/Facebook'

class Dashboard::IntegrationsController < Dashboard::ApplicationController
  # FINALIZE_OAUTH_CONTROLLER = "http://localhost:3000/integrations/facebook_finalizeOAuth"

  def index
  end

  def facebook

    logger.debug "the value in the env variables is as follows"
    logger.debug "Temboo Key name: #{ENV["TEMBOO_APP_KEY_NAME"]}"
    logger.debug "Temboo Key value: #{ENV["TEMBOO_APP_KEY_VALUE"]}"

    # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
    session = TembooSession.new("urbanzeak", ENV["TEMBOO_APP_KEY_NAME"], ENV["TEMBOO_APP_KEY_VALUE"])

    initializeOAuthChoreo = Facebook::OAuth::InitializeOAuth.new(session)

    logger.debug "The initialize value is: #{initializeOAuthChoreo}"

    # Get an InputSet object for the choreo
    initializeOAuthInputs = initializeOAuthChoreo.new_input_set()

    # Set inputs
    initializeOAuthInputs.set_AppID("555128847910730")

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
    session = TembooSession.new("urbanzeak", ENV["TEMBOO_APP_KEY_NAME"], ENV["TEMBOO_APP_KEY_VALUE"])

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
  end

end
