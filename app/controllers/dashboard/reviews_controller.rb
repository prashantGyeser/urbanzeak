class Dashboard::ReviewsController < Dashboard::ApplicationController
  def index
    @experiences = Experience.where(:user_id => current_user.id).includes(:attendees)
  end
end
