class Dashboard::MessagesController < Dashboard::ApplicationController
  def index
    @conversations = Conversation.where(:user_id => current_user.id).includes(:messages)
  end

  def show
    incoming_message_id = params[:id]
    message = Message.find(incoming_message_id)
    @message = Message.new
    if message.from == current_user.internal_email_id
      customer_selected = message.to
    else
      customer_selected = message.from
    end

    message_with_name = Message.where(:from => customer_selected).where('name IS NOT NULL').first
    if message_with_name.nil?
      @name = customer_selected
    else
      @name = message_with_name.name
    end
    @messages_from_person = Message.where(:from => customer_selected).all
    @messages_to_person = Message.where(:to => customer_selected).all
    @messages = [@messages_from_person, @messages_to_person].flatten
    @ordered_by_date_messages = @messages.sort_by { |k| k.created_at }

  end


  def create
    conversation_id = params[:conversation_id]
    message = params[:message]
    conversation = Conversation.find(conversation_id)
    to = conversation.sender_email_id

    @message = Message.new(from: current_user.internal_email_id, conversation_id: conversation_id, body: message, to: to)

    respond_to do |format|
      if @message.save
        format.json{ render :json => @message }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

  end

end
