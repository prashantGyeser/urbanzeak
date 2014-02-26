# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  user_id         :integer
#  experience_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#  to              :string(255)
#  from            :string(255)
#  cc              :string(255)
#  subject         :string(255)
#  body            :text
#  raw_text        :text
#  raw_html        :text
#  raw_body        :text
#  headers         :text
#  raw_headers     :text
#  guid            :string(255)
#  conversation_id :integer
#

class Message < ActiveRecord::Base
  # Serializing the to column becuase it comes in as an array from Mandrill
  # Refer http://api.rubyonrails.org/classes/ActiveRecord/Base.html for details on serialization
  #serialize :to

  belongs_to :conversation

  after_create :send_email_notification

  private

  def send_email_notification
    logger.debug "Ok it is getting into the right function, now need to check why it is being sent twice"
    conversation = Conversation.find(self.conversation_id)
    host = User.find(conversation.user_id)
    if self.to == host.email
      NotificationsMailer.host_message_notification(self, conversation).deliver
    else
      logger.debug "It is getting to the else also why?"
      NotificationsMailer.message_notification(self, conversation).deliver
    end
    logger.debug "Ok it is getting into the right function, now need to check why it is being sent twice"

  end



end
