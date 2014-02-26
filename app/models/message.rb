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
    NotificationsMailer.message_notification(self, Conversation.find(self.conversation_id)).deliver
  end



end
