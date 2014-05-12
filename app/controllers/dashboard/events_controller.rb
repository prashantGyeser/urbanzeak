class Dashboard::EventsController < Dashboard::ApplicationController
  def index
    @events = Event.where(user: current_user)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    event_dates = params[:event_dates].split(',')
    event_dates.each do |event_date|
      @event.event_dates.build(:event_date => Date.strptime(event_date.to_s, '%m/%d/%Y'))
    end

    images = params[:images]
    if images.present?
      event_images = JSON.parse(images)
      event_images.each do |event_image|
        @event.event_images.build(url: event_image["url"], filename: event_image["filename"])
      end
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :price, :things_to_remember, :line_one, :line_two, :state, :city, :landmark, :country, :pincode, :latitude, :longitude, :tagline, :what_does_this_include, :max_seats, :category, :event_dates, :event_time, :duration, :experience_image_attributes => [:id, :image])
  end
end
