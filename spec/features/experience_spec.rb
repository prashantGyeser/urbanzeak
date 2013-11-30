require 'spec_helper'

describe 'Experience' do
  describe 'new' do

    before :each do
      visit('/experiences/new')
    end
    it 'should be available' do
      page.status_code.should == 200
    end

    it 'should have a form' do
      expect(page).to have_css '#new_experience'
    end
    
  end

end