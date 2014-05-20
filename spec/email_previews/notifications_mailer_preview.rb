class NotificationsMailerPreview < ActionMailer::Preview
  def experience_created
    experience = Experience.first
    host = User.find(experience.user_id)
    NotificationsMailer.experience_created(experience, host)
  end

end