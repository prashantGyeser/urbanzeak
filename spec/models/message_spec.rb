# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  message       :text
#  user_id       :integer
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Message do
  pending "add some examples to (or delete) #{__FILE__}"
end
