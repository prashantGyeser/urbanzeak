# == Schema Information
#
# Table name: experience_images
#
#  id            :integer          not null, primary key
#  image         :string(255)
#  experience_id :integer
#  type          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class ExperienceImage < ActiveRecord::Base
	mount_uploader :image , ImageUploader

end
