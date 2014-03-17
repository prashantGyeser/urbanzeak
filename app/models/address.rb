# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  line_one      :string(255)
#  line_two      :string(255)
#  city          :string(255)
#  state         :string(255)
#  pincode       :string(255)
#  country       :string(255)
#  experience_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Address < ActiveRecord::Base
end
