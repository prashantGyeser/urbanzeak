require 'spec_helper'

describe "Experiences" do
  describe "creating a experience" do
    it "creates a experience" do
      visit new_experience_path
      within("#newExperience") do
        fill_in 'Name', :with => 'A test experience from capybara'
      end
    end
  end



end
