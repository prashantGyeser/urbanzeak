# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    name "MyString"
    email "MyString"
    message "MyText"
    user_id 1
    experience_id 1
  end
end
