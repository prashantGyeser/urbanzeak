class Dashboard::NotificationsController < Dashboard::ApplicationController
  def communication
    @messages = Message.where(:to => current_user.internal_email_id)
    @messages_by_email = @messages.group_by { |message| message.from }
    @message = Message.new
  end
end
