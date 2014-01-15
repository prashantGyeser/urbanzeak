require 'spec_helper'

describe "AdvanceBookings" do
  describe "GET /advance_bookings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get advance_bookings_path
      response.status.should be(200)
    end
  end
end
