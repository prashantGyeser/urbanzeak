class Dashboard::AlgoController < Dashboard::ApplicationController
  def index
    @leads = Lead.find_by_user_id(current_user.id)
  end
end
