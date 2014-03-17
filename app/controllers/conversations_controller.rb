class ConversationsController < ApplicationController

  # POST /messages
  # POST /messages.json
  def create
    @conversation = Conversation.new()
    @conversation.sender_email_id = params[:message][:from]
    experience = Experience.find(params[:message][:experience_id])
    user = User.find(experience.user_id)
    @conversation.user_id = user.id
    @conversation.experience_id = experience.id
    @conversation.customer_name = params[:message][:name]
    @message = @conversation.messages.build(message_params)
    @message.to = user.email

    respond_to do |format|
      if @conversation.save
        @message.save
        format.json{ render :json => @conversation }
      else
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:name, :from, :body, :user_id, :experience_id)
  end

end
