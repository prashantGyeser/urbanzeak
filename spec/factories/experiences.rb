# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience do
    name "MyString"
    description "MyText"
    price "9.99"
    exp_date "2013-11-28"
    exp_time "2013-11-28 16:41:04"
    latitude 1.5
    longitude 1.5
  end
end
