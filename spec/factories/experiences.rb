# Read about factories at https://github.com/thoughtbot/factory_girl

# Todo: Add fake data for the tests using faker
# Refer to http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html for an example
# require 'faker'

FactoryGirl.define do
  factory :experience do
    name "experience name"
    description "some long description. This should have html tags soon"
    price "9.99"
    exp_date "2013-11-28"
    exp_time "2013-11-28 16:41:04"
    latitude  38.898556
    longitude -77.037852
  end
end
