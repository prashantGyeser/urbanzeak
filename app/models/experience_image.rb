# == Schema Information
#
# Table name: experience_images
#
#  id            :integer          not null, primary key
#  image         :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  random_id     :string(255)
#  image_type    :string(255)
#

class ExperienceImage < ActiveRecord::Base
	#mount_uploader :image , ImageUploader
	belongs_to :experience
end
