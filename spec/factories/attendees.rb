# == Schema Information
#
# Table name: attendees
#
#  id            :integer          not null, primary key
#  seats         :integer
#  user_id       :integer
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendee do
    seats 1
    user_id 1
    experience_id 1
  end
end
