class UserMailer < ActionMailer::Base
  default :from => 'hello@urbanzeak.com'

  def signup_confirmation(user)
    @user = user
    logger.debug "The user is: #{user}"
    mail(:to => user.email, :subject => "Sign Up Confirmation")
  end

  def founder_welcome(user, time_to_send)
    email_subject = "UrbanZeak - Need help?"
    from = "prashant@urbanzeak.com"
    @name = user.first_name

    mail   to:      user.email, # normal mailer stuff
           subject: email_subject,
           :from => from

    mergeVars =
        {
            "NAME"             => user.first_name
        }
    headers['X-MC-MergeVars'] = mergeVars.to_json

    headers['X-MC-Template'] = "need-help-autoresponder-urbanzeak"
    headers['X-MC-Track'] = "opens"
    headers['X-MC-SendAt'] = "#{time_to_send}"
  end


end
