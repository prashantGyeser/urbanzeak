# == Schema Information
#
# Table name: exp_images
#
#  id            :integer          not null, primary key
#  url           :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class ExpImage < ActiveRecord::Base
  belongs_to :experience
end
