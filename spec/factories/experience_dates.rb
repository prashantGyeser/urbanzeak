# == Schema Information
#
# Table name: experience_dates
#
#  id              :integer          not null, primary key
#  experience_date :date
#  experience_time :time
#  experience_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience_date do
    experience_date "2014-01-29"
    experience_time "2014-01-29 21:10:58"
    experience_id 1
  end
end
