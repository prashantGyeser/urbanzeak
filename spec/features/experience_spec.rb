require 'spec_helper'

describe 'Experience' do
  describe 'new' do

    before :each do
      visit('/experiences/new')
    end

    it 'should be available' do
      page.status_code.should == 200
    end

    it 'should have a new experience form' do
      expect(page).to have_css '#new_experience'
    end

    it 'should create an experience' do
      experience = FactoryGirl.create(:experience)
      expect(experience).to eq(Experience.last)
    end

  end

end