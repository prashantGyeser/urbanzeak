class Dashboard::NotificationsController < Dashboard::ApplicationController
  def communication
    @messages = Message.where(user_id: current_user.id)
    @messages_by_email = @messages.group_by { |message| message.email}
  end
end
