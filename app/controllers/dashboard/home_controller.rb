class Dashboard::HomeController < Dashboard::ApplicationController
  def index

    # Views from the beginning of time for all the experiences for this user
    @total_views = Experience.total_visits_this_month(current_user.id)
    @total_views_today = Experience.total_visits_today(current_user.id)
    @total_sales_today = 0 #Experience.todays_sales(current_user.id)
    @total_sales = 0


  	# Getting the views for the last 7 days and storing it in an array
  	#@views = []
  	i = 1
  	@experiences = Experience.where(:user_id => current_user.id)
  	@views = []
    @purchases = []

    while i < 8
      total_views = 0
      total_purchases = 0
      @experiences.each do |experience|
        views_for_the_day = experience.impressionist_count(:start_date=> (Date.today - (i + 1)),:end_date=>(Date.today - i))
        total_views = total_views + views_for_the_day
        # Getting the attendees
        purchase_count = Attendee.where(:experience_id => experience.id).where(:attending_date => Date.today + i).count
        total_purchases = total_purchases + purchase_count
      end
      @views << [i, total_views]
      if total_purchases.nil?
        total_purchases = 0
      end

      #@purchases << [i, total_purchases]
      @purchases << {"y" => (Date.today + i).to_s, "purchases" => total_purchases}

      i = i + 1




    end

    @total_views_by_day = []

    @views.each { |record| @total_views_by_day << {'day' => record[0], 'total_views' => record[1].to_i} }

    # Getting the total tickets sold per day, for dates over the next four weeks


  end
end
