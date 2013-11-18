# == Schema Information
#
# Table name: images
#
#  id            :integer          not null, primary key
#  filename      :string(255)
#  url           :string(255)
#  key           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  experience_id :integer
#

class Image < ActiveRecord::Base
	belongs_to :experience
end
