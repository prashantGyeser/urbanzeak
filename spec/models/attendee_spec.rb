# == Schema Information
#
# Table name: attendees
#
#  id             :integer          not null, primary key
#  seats          :integer
#  user_id        :integer
#  experience_id  :integer
#  created_at     :datetime
#  updated_at     :datetime
#  phone_number   :string(255)
#  email          :string(255)
#  attending_date :date
#  price          :decimal(, )
#  attending_on   :date
#  attending_at   :time
#

require 'spec_helper'

describe Attendee do
  pending "add some examples to (or delete) #{__FILE__}"
end
