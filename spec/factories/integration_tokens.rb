# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :integration_token do
    token "MyString"
    provider "MyString"
    user_id 1
    returned_values "MyText"
  end
end
