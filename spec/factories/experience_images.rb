# == Schema Information
#
# Table name: experience_images
#
#  id            :integer          not null, primary key
#  image         :string(255)
#  experience_id :integer
#  type          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience_image do
    image "MyString"
    experience_id 1
    type ""
  end
end
