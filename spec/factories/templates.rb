# == Schema Information
#
# Table name: templates
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  summary              :text
#  description          :text
#  what_does_it_include :text
#  things_to_remember   :text
#  price                :decimal(, )
#  exp_date             :date
#  exp_time             :time
#  latitude             :float
#  longitude            :float
#  address_line_one     :string(255)
#  address_line_two     :string(255)
#  city                 :string(255)
#  state                :string(255)
#  country              :string(255)
#  zipcode              :string(255)
#  landmark             :string(255)
#  max_seats            :integer
#  random_id            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  user_id              :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template do
    name "MyString"
    summary "MyText"
    description "MyText"
    what_does_it_include "MyText"
    things_to_remember "MyText"
    price "9.99"
    exp_date "2014-01-17"
    exp_time "2014-01-17 17:30:53"
    latitude 1.5
    longitude 1.5
    address_line_one "MyString"
    address_line_two "MyString"
    city "MyString"
    state "MyString"
    country "MyString"
    zipcode "MyString"
    landmark "MyString"
    max_seats 1
    random_id "MyString"
  end
end
