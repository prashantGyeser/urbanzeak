require 'spec_helper'

describe "Experiences" do
  describe "List experiences" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get experiences_path
      response.status.should be(200)
    end
  end

  describe "New experience" do
    it 'shows the new experience page' do
      visit new_experience_path

    end

  end

end
