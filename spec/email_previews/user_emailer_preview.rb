class UserMailerPreview < ActionMailer::Preview
  def signup_confirmation
    user = User.first
    UserMailer.signup_confirmation(user)
  end

  def founder_welcome
    user = User.first
    UserMailer.founder_welcome(user, Time.now)
  end

end