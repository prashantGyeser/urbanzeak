# == Schema Information
#
# Table name: exp_images
#
#  id            :integer          not null, primary key
#  url           :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exp_image do
    url "MyString"
    experience_id 1
  end
end
