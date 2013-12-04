class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, only: [:become_host, :edit, :update, :destroy, :dashboard]

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(host_params)

    @host.user_id = current_user.id

    respond_to do |format|
      if @host.save
        format.html { redirect_to hosts_dashboard_path, notice: 'Host was successfully created.' }
        format.json { render action: 'show', status: :created, location: @host }
      else
        format.html { render action: 'new' }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url }
      format.json { head :no_content }
    end
  end

  def become_host
    @user = current_user
    @user.host = true
    respond_to do |format|
      if @user.save
        format.html { redirect_to hosts_dashboard_path, notice: 'Congratulations! You can now post your experiences on UrbanZeak.' }
        format.json { head :no_content }
      else
        format.html { redirect_to pages_sell_path }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  def dashboard
    #@experience = Experience.last
    #logger.debug "The impressions for a model are: #{@experience.impressionist_count()}"
    @experiences = Experience.where(:user_id => current_user.id)
    @total_experiences = @experiences.count
    @total_views = 0

    @has_about =

    @experiences.each do |experience|
      @total_views = @total_views + experience.impressionist_count(:filter=>:all)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:title, :about, :avatar)
    end
end
