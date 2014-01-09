class Dashboard::HomeController < Dashboard::ApplicationController
  def index
  	# Getting the views for the last 7 days and storing it in an array
  	#@views = []
  	i = 1
  	@experiences = Experience.where(:user_id => current_user.id)
  	@views = []

  	while i < 8
  		total_views = 0
  		@experiences.each do |experience|
  			views_for_the_day = experience.impressionist_count(:start_date=> (Date.today - (i + 1)),:end_date=>(Date.today - i))
  			total_views = total_views + views_for_the_day
  		end
  		@views << [i, total_views]
  		i = i + 1
  	end
  	
  	logger.debug "The value in the views is: #{@views.inspect}"

  end
end
