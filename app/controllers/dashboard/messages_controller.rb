class Dashboard::MessagesController < Dashboard::ApplicationController
  def index

    #Route.where("a = true and b = true and ((c > 0 and c < 1) or d = 1)").all
    #@messages = Message.where(:to => current_user.email AND :from => current_user.email)
    @messages_to = Message.where(:to => current_user.internal_email_id)
    @messages_from = Message.where(:from => current_user.internal_email_id)
    @messages = [@messages_to, @messages_from].flatten
    #@messages_groups = @messages.group_by(&:from)
    @messages_groups = @messages.group_by { |m| m[:from] }
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
    to = params[:to]
    message = params[:message]
    @message = Message.new(from: current_user.internal_email_id, to: to, body: message)

    respond_to do |format|
      if @message.save
        format.json{ render :json => @message }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end



  end

end
