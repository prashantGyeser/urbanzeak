# == Schema Information
#
# Table name: conversations
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  sender_email_id :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  experience_id   :integer
#  customer_name   :string(255)
#

class Conversation < ActiveRecord::Base
  has_many :messages
  belongs_to :user
end
