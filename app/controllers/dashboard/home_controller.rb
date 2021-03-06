class Dashboard::HomeController < Dashboard::ApplicationController
  def index
    @host = current_user
    @purchases = Experience.where(:user_id => @host.id).includes(:attendees)
    #@conversations = Conversation.where(:user_id => @host.id).where(:created_at => Date.today)
    @conversations = Conversation.where(:user_id => @host.id).last(6)
    @reviews = Experience.where(:user_id => @host.id).includes(:reviews)
  end
end
