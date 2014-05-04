class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  #before_filter :authenticate_user!, only: [:create]

  # GET /attendees
  # GET /attendees.json
  def index
    @attendees = Attendee.all
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)
    logger.debug "The params are: #{params.inspect}"
    #@attendee.attending_date = Date.strptime(params[:attendee][:attending_date].to_s, '%m/%d/%Y')
    exp_date = ExperienceDate.where(:experience_id => params[:attendee][:experience_id]).first.experience_date

    @attendee.attending_date = exp_date
    logger.debug "The attending date is: #{exp_date}"
    logger.debug "The attending date is: #{@attendee.inspect}"
    respond_to do |format|
      if @attendee.save
        #format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.html { redirect_to experience_path(@attendee.experience_id), notice: 'RSVP was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendee }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1
  # PATCH/PUT /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee.destroy
    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:seats, :phone_number, :email, :experience_id, :attending_date)
    end
end
