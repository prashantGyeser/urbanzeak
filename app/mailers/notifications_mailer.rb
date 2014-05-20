class NotificationsMailer < ActionMailer::Base
  def message_notification(message, conversation, host)
    @message = message

    from = "#{host.first_name} <#{host.email}>"
    to = "#{conversation.customer_name} <#{conversation.sender_email_id}>"
    mail(:to => to, :subject => "You have a new reply", :from => from)

    reply_to = conversation.id.to_s + "@inbound.urbanzeak.com"
    headers['Reply-To'] = reply_to

  end

  def host_message_notification(message, conversation, host)
    @message = message
    to = "#{host.first_name} <#{host.email}>"
    from = "#{conversation.customer_name} <#{conversation.sender_email_id}>"
    mail(:to => message.to, :subject => "You have a new message", :from => message.from)
  end

  def joined_experience(experience, attendee, exp_time, experience_date)
    @experience = experience
    @attendee = attendee
    @experience_time = exp_time
    @experience_date = experience_date
    @total_paid = experience.price * attendee.seats
    @host = User.find(@experience.user_id)
    mail(:to => @attendee.email, :subject => "Ticket purchase confirmation for #{@experience.name}", :from => "notifications@urbanzeak.com")
  end

  def experience_created(experience, host)
    to  = "#{host.first_name} <#{host.email}>"
    from = "urbanzeak support <support@urbanzeak.com>"
    @experience = experience
    @host = host
    mail(:to => to, :subject => "urbanzeak - Website created", :from => from)
  end

end
