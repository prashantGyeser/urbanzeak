# == Schema Information
#
# Table name: potentials
#
#  id             :integer          not null, primary key
#  site           :string(255)
#  site_type      :string(255)
#  potential_type :string(255)
#  description    :text
#  todo           :text
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :potential do
    site "MyString"
    site_type "MyString"
    potential_type "MyString"
    description "MyText"
    todo "MyText"
  end
end
