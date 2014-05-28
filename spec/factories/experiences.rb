# == Schema Information
#
# Table name: experiences
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  price                  :decimal(15, 2)
#  exp_date               :date
#  exp_time               :time
#  latitude               :float
#  longitude              :float
#  created_at             :datetime
#  updated_at             :datetime
#  city                   :string(255)
#  image                  :string(255)
#  user_id                :integer
#  what_does_this_include :text
#  things_to_remember     :text
#  max_seats              :integer
#  template               :boolean
#  shortened_url          :string(255)
#  summary                :text
#  line_one               :string(255)
#  line_two               :string(255)
#  state                  :string(255)
#  pincode                :string(255)
#  country                :string(255)
#  land_mark              :string(255)
#  random_id              :string(255)
#  template_id            :integer
#  tagline                :string(255)
#  images                 :string(255)
#  category               :string(255)
#  hours                  :integer
#  minutes                :integer
#  slug                   :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

# Todo: Add fake data for the tests using faker
# Refer to http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html for an example
require 'faker'

FactoryGirl.define do
  factory :experience do
    name Faker::Lorem.sentence(1)
    what_does_this_include Faker::Lorem.paragraph(2)
    tagline Faker::Lorem.sentence(3)
    line_one Faker::Address.street_name
    city Faker::Address.city
    country Faker::Address.country
    price 9.99
    max_seats 5
    #exp_date "2013-11-28"
    exp_time "7:15 PM"
    latitude  38.898556
    longitude -77.037852
    land_mark Faker::Address.city
    exp_date '05/19/2014,05/27/2014,05/28/2014'
    hours 3
  end
end
