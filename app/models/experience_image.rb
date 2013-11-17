# == Schema Information
#
# Table name: experience_images
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  url           :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#
-
class ExperienceImage < ActiveRecord::Base
	belongs_to :experience
end
