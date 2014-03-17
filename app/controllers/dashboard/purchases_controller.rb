class Dashboard::PurchasesController < Dashboard::ApplicationController
  def index
    @experiences = current_user.experiences.includes(:attendees)
  end
end
