class AdvanceBookingsController < ApplicationController
  before_action :set_advance_booking, only: [:show, :edit, :update, :destroy]

  # GET /advance_bookings
  # GET /advance_bookings.json
  def index
    @advance_bookings = AdvanceBooking.all
  end

  # GET /advance_bookings/1
  # GET /advance_bookings/1.json
  def show
  end

  # GET /advance_bookings/new
  def new
    @advance_booking = AdvanceBooking.new
  end

  # GET /advance_bookings/1/edit
  def edit
  end

  # POST /advance_bookings
  # POST /advance_bookings.json
  def create
    @advance_booking = AdvanceBooking.new(advance_booking_params)
    logger.debug "The params are: #{params}"
    respond_to do |format|
      if @advance_booking.save
        experience = Experience.find(@advance_booking.experience_id)
        format.html { redirect_to experience, notice: 'Booking was successfully created. We will let you know if there is an event happening that day' }
        format.json { render action: 'show', status: :created, location: @advance_booking }
      else
        format.html { render action: 'new' }
        format.json { render json: @advance_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advance_bookings/1
  # PATCH/PUT /advance_bookings/1.json
  def update
    respond_to do |format|
      if @advance_booking.update(advance_booking_params)
        format.html { redirect_to @advance_booking, notice: 'Advance booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advance_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advance_bookings/1
  # DELETE /advance_bookings/1.json
  def destroy
    @advance_booking.destroy
    respond_to do |format|
      format.html { redirect_to advance_bookings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance_booking
      @advance_booking = AdvanceBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advance_booking_params
      params.require(:advance_booking).permit(:name, :email, :booking_date, :experience_id)
    end
end
