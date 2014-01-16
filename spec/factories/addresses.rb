# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  line_one      :string(255)
#  line_two      :string(255)
#  city          :string(255)
#  state         :string(255)
#  pincode       :string(255)
#  country       :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    line_one "MyString"
    line_two "MyString"
    city "MyString"
    state "MyString"
    pincode "MyString"
    country "MyString"
    experience_id 1
  end
end
