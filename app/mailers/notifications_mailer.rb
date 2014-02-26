class NotificationsMailer < ActionMailer::Base
  def message_notification(message, conversation)

    @message = message
    mail(:to => message.to, :subject => "You have a new reply", :from => message.from)

    reply_to = conversation.id.to_s + "@inbound.urbanzeak.com"
    headers['Reply-To'] = reply_to

  end

  def host_message_notification(message, conversation)
    @message = message
    mail(:to => message.to, :subject => "You have a new message", :from => message.from)
  end

end
