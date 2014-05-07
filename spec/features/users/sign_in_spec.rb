require 'spec_helper'

feature 'Sign in' do

  background do
    @user = FactoryGirl.create(:user)
  end

  scenario 'I can sign in with valid credentials' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => 'password@123'
    end
    click_button 'Login'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'I cannot sign in with an invalid password' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => 'password@1234'
    end
    click_button 'Login'
    expect(page).to have_content 'Invalid email or password'
  end

end