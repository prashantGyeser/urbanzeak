# == Schema Information
#
# Table name: integration_tokens
#
#  id              :integer          not null, primary key
#  token           :string(255)
#  provider        :string(255)
#  user_id         :integer
#  returned_values :text
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :integration_token do
    token "MyString"
    provider "MyString"
    user_id 1
    returned_values "MyText"
  end
end
