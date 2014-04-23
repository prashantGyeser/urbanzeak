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

class Version < ActiveRecord::Base
  belongs_to :experience



end
