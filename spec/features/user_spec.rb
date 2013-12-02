require 'spec_helper'

describe 'User' do

  describe 'registration' do
    before :each do
      visit('/users/sign_up')
    end

    it "should load" do
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

      end
      page.should have_content("Welcome! You have signed up successfully.")

      #User.last.should eq()
    end

  end


  describe 'login' do
    it 'should login a user with valid credentials' do
      visit('/users/sign_in')
      user = FactoryGirl.create(:user)
      within('#login') do
        fill_in 'Email', :with => 'user.email'
        fill_in 'Password', :with => 'user.password'
      end

      click_button('Sign in')

    end
    
  end

end