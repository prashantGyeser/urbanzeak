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

class Lead < ActiveRecord::Base
end
