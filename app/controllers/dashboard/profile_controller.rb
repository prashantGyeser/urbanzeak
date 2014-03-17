class Dashboard::ProfileController < Dashboard::ApplicationController
  def about

  	@host = Host.where(:user_id => current_user.id).first

  	if @host.blank?
  		@host = Host.new
  	end
  end

  def create
  	@host = Host.create(host_params)

  	respond_to do |format|
  		if @host.save
  			format.html { redirect_to dashboard_profile_about_path, notice: 'Added your details successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendee }
  		else
  			format.html { render action: 'new' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
  		end
  	end

  end

  protected 

  def host_params
    params.require(:host).permit(:about, :avatar)
  end

end
