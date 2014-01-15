# == Schema Information
#
# Table name: advance_bookings
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  booking_date  :date
#  created_at    :datetime
#  updated_at    :datetime
#  experience_id :integer
#

class AdvanceBooking < ActiveRecord::Base
end
