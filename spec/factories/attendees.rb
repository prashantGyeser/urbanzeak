# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendee do
    seats 1
    user_id 1
    experience_id 1
  end
end
