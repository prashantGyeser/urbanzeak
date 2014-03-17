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

end
