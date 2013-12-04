# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  about      :text
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :host do
    title "MyString"
    about "MyText"
  end
end
