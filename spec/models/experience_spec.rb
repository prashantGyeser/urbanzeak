# == Schema Information
#
# Table name: experiences
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  price                  :decimal(15, 2)
#  exp_date               :date
#  exp_time               :time
#  latitude               :float
#  longitude              :float
#  created_at             :datetime
#  updated_at             :datetime
#  city                   :string(255)
#  image                  :string(255)
#  user_id                :integer
#  what_does_this_include :text
#  things_to_remember     :text
#  max_seats              :integer
#  template               :boolean
#

require 'spec_helper'

describe Experience do
  it "should have a valid factory" do
    FactoryGirl.create(:experience).should be_valid
  end
  it "should have a name" do
    FactoryGirl.build(:experience, name: nil).should_not be_valid
  end
  it 'should have a description' do
    FactoryGirl.build(:experience, description: nil).should_not be_valid
  end
  it 'should have a price' do
    FactoryGirl.build(:experience, price: nil).should_not be_valid
  end
  it 'should have a exp_date' do
    FactoryGirl.build(:experience, exp_date: nil).should_not be_valid
  end
  it 'should have a exp_time' do
    FactoryGirl.build(:experience, exp_time: nil).should_not be_valid
  end
end
