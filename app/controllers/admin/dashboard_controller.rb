class Admin::DashboardController < ApplicationController
  def index
    @hosts = User.all

  end
end
