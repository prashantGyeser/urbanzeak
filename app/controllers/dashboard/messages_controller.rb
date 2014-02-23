class Dashboard::MessagesController < Dashboard::ApplicationController
  def index

    #Route.where("a = true and b = true and ((c > 0 and c < 1) or d = 1)").all
    #@messages = Message.where(:to => current_user.email AND :from => current_user.email)
    @messages_to = Message.where(:to => current_user.internal_email_id)
    @messages_from = Message.where(:from => current_user.internal_email_id)
    @messages = [@messages_to, @messages_from].flatten

  end

  def show
  end
end
