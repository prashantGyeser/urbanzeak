# == Schema Information
#
# Table name: experiences
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  exp_date    :date
#  exp_time    :time
#  price       :decimal(, )
#  latitude    :float
#  longitude   :float
#  max_seats   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Experience < ActiveRecord::Base
end
