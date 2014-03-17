# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :potential do
    site "MyString"
    site_type "MyString"
    potential_type "MyString"
    description "MyText"
    todo "MyText"
  end
end
