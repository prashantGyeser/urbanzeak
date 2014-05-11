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
#

require 'spec_helper'

describe Event do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:tagline)}
  it {should validate_presence_of(:what_does_this_include)}
  it {should validate_presence_of(:price)}
  it {should validate_presence_of(:max_seats)}
  it {should validate_presence_of(:line_one)}
  it {should validate_presence_of(:city)}
  it {should validate_presence_of(:country)}
  it {should validate_presence_of(:landmark)}
  it {should validate_presence_of(:latitude)}
  it {should validate_presence_of(:longitude)}
end
