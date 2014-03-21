# == Schema Information
#
# Table name: leads
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  potential_id  :integer
#  created_at    :datetime
#  updated_at    :datetime
#  experience_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead do
    user_id 1
    potential_id 1
  end
end
