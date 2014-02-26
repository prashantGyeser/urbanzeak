class NotificationsMailer < ActionMailer::Base
  def message_notification(message, conversation)
    logger.debug  "Ok it is getting here with the fiollwoing message: #{message}"
    logger.debug  "Ok it is getting here with the fiollwoing conversation: #{conversation}"
    mail(:to => message.to, :subject => "You have a new reply", :from => message.from)
  end
end
