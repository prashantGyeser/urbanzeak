class Dashboard::PurchasesController < Dashboard::ApplicationController
  def index
    @experiences = current_user.experiences.includes(:attendees)
    @has_experiences = Experience.host_has_experiences(current_user.id)

  end
end
