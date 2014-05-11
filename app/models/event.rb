# == Schema Information
#
# Table name: events
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  tagline                :string(255)
#  what_does_this_include :text
#  things_to_remember     :text
#  price                  :decimal(, )
#  max_seats              :integer
#  line_one               :string(255)
#  line_two               :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  country                :string(255)
#  pincode                :string(255)
#  landmark               :string(255)
#  duration               :integer
#  latitude               :float
#  longitude              :float
#  created_at             :datetime
#  updated_at             :datetime
#

class Event < ActiveRecord::Base
  validates :name, :tagline, :what_does_this_include, :price, :max_seats, :line_one, :city, :country, :landmark, :latitude, :longitude, :presence => true
end
