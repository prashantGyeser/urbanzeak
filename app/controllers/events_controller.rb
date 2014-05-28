class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @attendee = Attendee.new
    @images = EventImage.where(event_id: @event.id)
  end
end
