class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @attendee = Attendee.new
  end
end
