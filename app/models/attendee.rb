# == Schema Information
#
# Table name: attendees
#
#  id            :integer          not null, primary key
#  seats         :integer
#  user_id       :integer
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  phone_number  :string(255)
#  email         :string(255)
#

class Attendee < ActiveRecord::Base
end
