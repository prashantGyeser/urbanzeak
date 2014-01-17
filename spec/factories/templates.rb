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
