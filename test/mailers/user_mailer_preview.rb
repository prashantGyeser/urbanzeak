class UserMailerPreview < ActionMailer::Preview

  def signup_confirmation
    user = User.first
    UserMailer.signup_confirmation(user)
  end

end