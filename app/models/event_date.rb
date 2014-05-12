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

class EventDate < ActiveRecord::Base
  belongs_to :event
end
