#require 'spec_helper'
#
#describe 'Home' do
#  describe 'set as root' do
#    it "should be the root" do
#      visit('/')
#      #page.should have_css('img.logo')
#      page.status_code.should == 200
#    end
#
#  end
#
#  describe 'should have a signup as host if the user is not a host already' do
#    before(:each) do
#      visit('/')
#    end
#
#    it 'should show a host your experiences link if the user is not a host' do
#      user = FactoryGirl.create(:normal_user)
#    end
#
#  end
#
#  describe 'content' do
#    before(:each) do
#      visit('/')
#    end
#
#    it 'should have a topbar' do
#      page.should have_css('.topBar')
#    end
#
#    it 'should have a header' do
#      page.should have_css('.header')
#    end
#
#    it 'should have a filter' do
#      page.should have_css('.filter')
#    end
#
#    it 'should have a experiences' do
#      page.should have_css('.content')
#    end
#
#    it 'should have a host sell' do
#      page.should have_css('.sell')
#    end
#
#    it 'should have a footer' do
#      page.should have_css('.footer')
#    end
#
#  end
#
#end