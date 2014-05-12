# == Schema Information
#
# Table name: event_dates
#
#  id         :integer          not null, primary key
#  event_date :date
#  event_time :time
#  created_at :datetime
#  updated_at :datetime
#  event_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_date do
    event_date "2014-05-12"
    event_time "2014-05-12 12:52:23"
    experience_id 1
  end
end
