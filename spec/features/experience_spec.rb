require 'spec_helper'

describe 'Experience' do
  describe 'new' do

    it 'should be available' do
      visit('/experiences/new')
      page.status_code.should == 200
    end

    it 'should show a modal' do
      
    end
    
  end

end