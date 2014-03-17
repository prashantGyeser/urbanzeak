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

require 'spec_helper'

describe AdvanceBooking do
  pending "add some examples to (or delete) #{__FILE__}"
end
