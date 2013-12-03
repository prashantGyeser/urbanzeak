# == Schema Information
#
# Table name: experiences
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  price       :decimal(15, 2)
#  exp_date    :date
#  exp_time    :time
#  latitude    :float
#  longitude   :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Experience < ActiveRecord::Base
  validates :name, :description, :price, :exp_date, :exp_time, presence: true

  #has_many :exp_images
  #accepts_nested_attributes_for :exp_images, :reject_if => :all_blank, :allow_destroy => true

  mount_uploader :image, ImageUploader

end
