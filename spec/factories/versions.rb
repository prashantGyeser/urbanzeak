# == Schema Information
#
# Table name: versions
#
#  id              :integer          not null, primary key
#  price           :decimal(, )
#  experience_date :date
#  experience_time :time
#  experience_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#  max_seats       :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version do
    price "9.99"
    experience_date "2014-04-23"
    experience_time "2014-04-23 11:38:30"
    experience_id 1
  end
end
