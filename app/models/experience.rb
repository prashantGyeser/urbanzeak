# == Schema Information
#
# Table name: experiences
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  price           :float
#  venue           :string(255)
#  latitude        :float
#  longitude       :float
#  created_at      :datetime
#  updated_at      :datetime
#  city            :string(255)
#  categrory       :string(255)
#  experience_date :date
#  experience_time :time
#

class Experience < ActiveRecord::Base
	has_many :experience_images, :dependent => :destroy, :autosave => true
	accepts_nested_attributes_for :experience_images
end
