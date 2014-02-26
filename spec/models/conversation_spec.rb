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

require 'spec_helper'

describe Conversation do
  pending "add some examples to (or delete) #{__FILE__}"
end
