require 'spec_helper'
require 'support/mailer_macros'

feature 'Sign up' do

  background do
    reset_email
  end

  scenario 'I should be able to sign up for an account' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: 'capybara@urbanzeak.com'
      fill_in 'user_first_name', with: 'Capybara User'
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'capybarasubdomain'
    end
    click_button 'Sign up'

    expect(page).to have_content 'Welcome to urbanzeak'
  end

  scenario 'I should not be able to sign up with an already existing email id' do

    user = FactoryGirl.create(:user)

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: user.subdomain
    end
    click_button 'Sign up'

    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'I should receive a welcome email after sign up' do

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: 'capybara@urbanzeak.com'
      fill_in 'user_first_name', with: 'Capybara User'
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'capybarasubdomain'
    end
    click_button 'Sign up'

    expect(last_email.to).to include('capybara@urbanzeak.com')

  end

  scenario 'I should not be able to sign up if I use an already existing shop name' do
    pending
  end

  scenario 'Shop name is unique' do
    pending
  end

end