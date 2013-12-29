class Dashboard::NotificationsController < Dashboard::ApplicationController
  def communication
    @messages = Message.where(user_id: current_user.id)
    @messages_by_name = @messages.group_by { |message| message.name }
  end
end
