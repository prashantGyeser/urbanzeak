require 'spec_helper'

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
    User.create(:email => 'capybara@urbanzeak.com', :password => 'password@123', :password_confirmation => 'password@123')

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: 'capybara@urbanzeak.com'
      fill_in 'user_first_name', with: 'Capybara User'
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'capybarasubdomain'
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

end