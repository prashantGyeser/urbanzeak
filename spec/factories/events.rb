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
#  user_id                :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :event do
    name Faker::Lorem.word
    tagline Faker::Lorem.sentence(3)
    what_does_this_include Faker::Lorem.paragraph(5)
    things_to_remember Faker::Lorem.paragraph(3)
    price 9.99
    max_seats 6
    line_one Faker::Address.street_name
    city Faker::Address.city
    country Faker::Address.country
    landmark Faker::Address.street_name
    duration 2
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    user_id 1
  end
end
