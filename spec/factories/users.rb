# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'john@doe.com'
    first_name 'John'
    last_name 'Doe'
    city 'sometestEmail@test.com'
    password 'password@123'
  end

end
