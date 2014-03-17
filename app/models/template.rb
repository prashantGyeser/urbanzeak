# == Schema Information
#
# Table name: templates
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  summary              :text
#  description          :text
#  what_does_it_include :text
#  things_to_remember   :text
#  price                :decimal(, )
#  exp_date             :date
#  exp_time             :time
#  latitude             :float
#  longitude            :float
#  address_line_one     :string(255)
#  address_line_two     :string(255)
#  city                 :string(255)
#  state                :string(255)
#  country              :string(255)
#  zipcode              :string(255)
#  landmark             :string(255)
#  max_seats            :integer
#  random_id            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  user_id              :integer
#

class Template < ActiveRecord::Base
	belongs_to :user
	has_many :experiences

end
