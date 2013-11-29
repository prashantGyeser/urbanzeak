require 'spec_helper'

describe 'User' do
  describe 'registration' do
    before :each do
      visit('/users/sign_up')
    end

    it "should load" do
      #page.should have_css('img.logo')
      page.status_code.should == 200
    end

    it 'should register a new account' do
      within('#new_user') do
        fill_in 'user_email', :with => 'john@urbanzeak.com'
        fill_in 'user_first_name', :with => 'John'
        fill_in 'user_last_name', :with => 'Doe'
        fill_in 'user_city', :with => 'Hyderabad'
        fill_in 'user_password', :with => 'password@123'
        fill_in 'user_password_confirmation', :with => 'password@123'

        click_button('Sign up')

        page.should have_content("Signed up successfully")

      end
    end



  end

  describe 'login' do
    it 'should login a user with valid credentials' do
      user = FactoryGirl.create(:user)
      within('#login') do
        fill_in 'user_email', :with => 'user.email'
        fill_in 'user_password', :with => 'user.password'
      end

      click_button('Sign in')

    end
  end

end