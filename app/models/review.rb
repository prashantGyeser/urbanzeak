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
#  show          :boolean
#

class Review < ActiveRecord::Base
  belongs_to :experience
end
