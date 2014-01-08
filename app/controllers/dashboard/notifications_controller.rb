class Dashboard::NotificationsController < Dashboard::ApplicationController
  def communication
    #@messages = Message.where(:from => current_user.email || :to => current_user.email)
    @messages = Message.where('from = ? OR to = ?', current_user.email, current_user.email)
    @messages_by_name = @messages.group_by { |message| message.email }
    @message = Message.new
  end
end
