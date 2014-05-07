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
#  shortened_url          :string(255)
#  summary                :text
#  line_one               :string(255)
#  line_two               :string(255)
#  state                  :string(255)
#  pincode                :string(255)
#  country                :string(255)
#  land_mark              :string(255)
#  random_id              :string(255)
#  template_id            :integer
#  tagline                :string(255)
#  images                 :string(255)
#  category               :string(255)
#  hours                  :integer
#  minutes                :integer
#  slug                   :string(255)
#

require 'spec_helper'

describe Experience do
  it "should have a valid factory" do
    FactoryGirl.create(:experience).should be_valid
  end
  it "should have a name" do
    FactoryGirl.build(:experience, name: nil).should_not be_valid
  end
  it 'should have a price' do
    FactoryGirl.build(:experience, price: nil).should_not be_valid
  end
  it 'should have a what is included' do
    FactoryGirl.build(:experience, what_does_this_include: nil)
  end

  it {should validate_presence_of(:max_seats)}
  it {should validate_presence_of(:line_one)}
  it {should validate_presence_of(:city)}
  it {should validate_presence_of(:country)}

  it 'should return an array of available dates' do
    experience = FactoryGirl.build(:experience)
  end

end
