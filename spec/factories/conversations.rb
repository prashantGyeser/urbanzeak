# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
    user_id 1
    sender_email_id "MyString"
  end
end
