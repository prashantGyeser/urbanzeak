# == Schema Information
#
# Table name: conversations
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  sender_email_id :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  experience_id   :integer
#  customer_name   :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
    user_id 1
    sender_email_id "MyString"
  end
end
