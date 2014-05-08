# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  comment       :text
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  show          :boolean
#

# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :review do
    name Faker::Name.name
    email Faker::Internet.email
    comment Faker::Lorem.sentence(8)
  end
end
