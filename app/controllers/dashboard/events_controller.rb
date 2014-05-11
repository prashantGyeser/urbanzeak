class Dashboard::EventsController < ApplicationController
  def index
    @events = Event.where(user: current_user)
  end

  def new
  end

  def edit
  end

  private

  def set_event

  end
end
