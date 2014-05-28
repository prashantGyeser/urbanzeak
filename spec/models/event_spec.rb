# == Schema Information
#
# Table name: events
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  tagline                :string(255)
#  what_does_this_include :text
#  things_to_remember     :text
#  price                  :decimal(, )
#  max_seats              :integer
#  line_one               :string(255)
#  line_two               :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  country                :string(255)
#  pincode                :string(255)
#  landmark               :string(255)
#  duration               :integer
#  latitude               :float
#  longitude              :float
#  created_at             :datetime
#  updated_at             :datetime
#  user_id                :integer
#

require 'spec_helper'

describe Event do
  it "should have a valid factory" do
    create(:event).should be_valid
  end
  it "should have a name" do
    build(:event, name: nil).should_not be_valid
  end
  it "should have a landmark" do
    build(:event, landmark: nil).should_not be_valid
  end
  it "should have a price" do
    build(:event, price: nil).should_not be_valid
  end
  it "should have a max seats" do
    build(:event, max_seats: nil).should_not be_valid
  end
  it 'should belong to user' do
    e = Event.reflect_on_association(:user)
    expect(e.macro).to eq :belongs_to
  end
end
