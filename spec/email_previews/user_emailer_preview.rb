class UserMailerPreview < ActionMailer::Preview
  def signup_confirmation
    user = FactoryGirl.build(:user)

    UserMailer.signup_confirmation(user)

  end
end