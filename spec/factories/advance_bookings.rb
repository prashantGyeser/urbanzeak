# == Schema Information
#
# Table name: advance_bookings
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  booking_date  :date
#  created_at    :datetime
#  updated_at    :datetime
#  experience_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advance_booking do
    name "MyString"
    email "MyString"
    booking_date "2014-01-15"
  end
end
