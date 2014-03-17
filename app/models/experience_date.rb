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

class ExperienceDate < ActiveRecord::Base
end
