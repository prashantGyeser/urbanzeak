require 'temboo'
require 'Library/Facebook'

class Auth
  # Initializing the facebook auth process
  def self.initialize_auth(forwarding_url)


    session = TembooSession.new("urbanzeak", 'socialMediaIntegration', '24583a5a-0098-4660-9')

    initializeOAuthChoreo = Facebook::OAuth::InitializeOAuth.new(session)


    initializeOAuthInputs = initializeOAuthChoreo.new_input_set()


    initializeOAuthInputs.set_AppID("555128847910730")
    initializeOAuthInputs.set_Scope("publish_actions,publish_stream,manage_pages");
    initializeOAuthInputs.set_ForwardingURL(forwarding_url)

    initializeOAuthResults = initializeOAuthChoreo.execute(initializeOAuthInputs)

    callbackID = initializeOAuthResults.get_CallbackID()

    authorizationURL = initializeOAuthResults.get_AuthorizationURL()

    return authorizationURL, callbackID

  end

  def self.finalize_auth(tembooCallbackId)
    session = TembooSession.new("urbanzeak", 'socialMediaIntegration', '24583a5a-0098-4660-9')

    puts "Ok it is getting to the finalize"

    # Grab the callback ID out of the cookie
    retrievedCallbackID = tembooCallbackId

    # Instantiate the Choreo, using a previously instantiated TembooSession object,
    finalizeOAuthChoreo = Facebook::OAuth::FinalizeOAuth.new(session)

    # Get an InputSet object for the choreo
    finalizeOAuthInputs = finalizeOAuthChoreo.new_input_set()

    # Set inputs
    finalizeOAuthInputs.set_CallbackID(retrievedCallbackID)
    finalizeOAuthInputs.set_AppSecret("67e4d163ed22eaf2464a88f9b488e6aa")
    finalizeOAuthInputs.set_AppID("555128847910730")

    # Execute Choreo
    finalizeOAuthResults = finalizeOAuthChoreo.execute(finalizeOAuthInputs)

    # Get the Facebook access token
    accessToken = finalizeOAuthResults.get_AccessToken()

    return accessToken

  end

end