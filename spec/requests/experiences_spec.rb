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
    it 'should create a new experience' do
      visit new_experience_path
      within('#new') do
        fill_in 'Name', :with => 'A experience name through Capybara'

      end
    end

  end

  describe "Show each experience" do

  end
  
end
