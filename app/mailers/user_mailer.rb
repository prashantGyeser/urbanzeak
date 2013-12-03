class UserMailer < ActionMailer::Base
  default :from => 'hello@urbanzeak.com'

  def signup_confirmation(user)
    @user = user
    logger.debug "The user is: #{user}"
    mail(:to => user.email, :subject => "Sign Up Confirmation")
  end

  def founder_welcome

  end


end
