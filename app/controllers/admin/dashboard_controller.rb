class Admin::DashboardController < Admin::ApplicationController
  def index
    @hosts = User.all.includes(:experience)
  end
end
