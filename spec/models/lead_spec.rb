# == Schema Information
#
# Table name: leads
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  potential_id  :integer
#  created_at    :datetime
#  updated_at    :datetime
#  experience_id :integer
#

require 'spec_helper'

describe Lead do
  pending "add some examples to (or delete) #{__FILE__}"
end
