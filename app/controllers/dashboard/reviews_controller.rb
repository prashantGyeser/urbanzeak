class Dashboard::ReviewsController < Dashboard::ApplicationController
  def index
    @experiences = Experience.where(:user_id => current_user.id).includes(:attendees)
  end

  def add_review_to_show
    logger.debug "The params are: #{params.inspect}"

    @review = Review.find(params[:review_id])
    @review.show = true

    respond_to do |format|
      if @review.save
        format.json { render json: @review }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end

  end

end
