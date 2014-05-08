class Dashboard::ReviewsController < Dashboard::ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @experiences = Experience.where(:user_id => current_user.id).includes(:attendees)
  end

  def add_review_to_show
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
