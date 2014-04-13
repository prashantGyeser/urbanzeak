class Dashboard::PurchasesController < Dashboard::ApplicationController
  def index
    @experiences = current_user.experiences.includes(:attendees)
    @has_experiences = Experience.host_has_experiences(current_user.id)
    @has_purchases = Experience.host_has_purchases(current_user)
  end
end
