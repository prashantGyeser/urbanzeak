class NotificationsMailerPreview < ActionMailer::Preview
  def experience_created
    experience = Experience.first
    host = User.find(experience.user_id)
    NotificationsMailer.experience_created(experience, host)
  end

  def joined_experience
    experience = Experience.first
    attendee = Attendee.where(:experience_id => experience.id).first
    experience_time = ExperienceDate.where(:experience_id => experience.id).first.experience_time
    experience_date = ExperienceDate.where(:experience_id => experience.id).first.experience_date

    NotificationsMailer.joined_experience(experience, attendee, experience_time, experience_date)
  end

  def message_notification
    conversation = Conversation.first
    message = Message.where(:conversation_id => conversation.id).first
    host = User.find(conversation.user_id)
    NotificationsMailer.message_notification(message, conversation, host)
  end

end