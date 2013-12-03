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
#

class Attendee < ActiveRecord::Base
end
