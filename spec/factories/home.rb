FactoryGirl.define do
  factory :normal_user do
    email 'john@doe.com'
    first_name 'John'
    last_name 'Doe'
    city 'sometestEmail@test.com'
    password 'password@123'
  end
end