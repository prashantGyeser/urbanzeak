# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  comment       :text
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  show          :boolean
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    name "MyString"
    email "MyString"
    comment "MyText"
    experience_id 1
  end
end
