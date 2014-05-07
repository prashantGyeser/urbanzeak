# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  user_id         :integer
#  experience_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#  to              :string(255)
#  from            :string(255)
#  cc              :string(255)
#  subject         :string(255)
#  body            :text
#  raw_text        :text
#  raw_html        :text
#  raw_body        :text
#  headers         :text
#  raw_headers     :text
#  guid            :string(255)
#  conversation_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :message do
    name Faker::Name.name
    #email Faker::Internet.email
    body Faker::Lorem.paragraph(3)
  end
end
