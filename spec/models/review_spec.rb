# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  comment       :text
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Review do
  pending "add some examples to (or delete) #{__FILE__}"
end
