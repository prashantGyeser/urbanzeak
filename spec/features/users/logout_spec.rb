require 'spec_helper'

feature 'User log out', :js => true do

  scenario 'I should be able to logout once I login' do

    user = FactoryGirl.create(:user)

    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => 'password@123'
    end
    click_button 'Login'

    #first(:link, "Logout").click
    click_link('Logout')

    visit '/dashboard/'

    expect(page).to have_content "You need to sign in or sign up before continuing."

  end
end