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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    tagline "MyString"
    what_does_this_include "MyText"
    things_to_remember "MyText"
    price "9.99"
    max_seats 1
    line_one "MyString"
    line_two "MyString"
    city "MyString"
    state "MyString"
    country "MyString"
    pincode "MyString"
    landmark "MyString"
    duration 1
    latitude 1.5
    longitude 1.5
  end
end
