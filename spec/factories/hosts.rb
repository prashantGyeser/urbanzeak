# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  about      :text
#  created_at :datetime
#  updated_at :datetime
#  avatar     :string(255)
#  user_id    :integer
#  name       :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :host do
    name Faker::Lorem.word
    about Faker::Lorem.sentence
  end
end
