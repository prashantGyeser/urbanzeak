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

require 'spec_helper'

before :each do
  @experience = Experience.new "Some awesome name for this experience",
                               "Some long description for this experience to see how things look"
end

describe Experience do
  pending "add some examples to (or delete) #{__FILE__}"
end
