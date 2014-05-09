require 'spec_helper'
require 'support/mailer_macros'
require 'faker'

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

  scenario 'I should not be able to sign up with a reserved subdomain' do
    user = FactoryGirl.build(:user)
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'www'
    end
    click_button 'Sign up'

    #expect(page).to have_content('The shopname you entered is already in use. Please pick another.')
    expect(page).to have_content('Subdomain is reserved')

  end

  scenario 'It should show me an error message when I try to sign up with an existing subdomain' do
    user = FactoryGirl.create(:user)

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: user.subdomain
    end
    click_button 'Sign up'

    expect(page).to have_content('Subdomain has already been taken')

  end

  scenario 'It should show me an error message when I try to sign up with an invalid subdomain' do
    user = FactoryGirl.create(:user)

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: '$#$$#%#$'
    end
    click_button 'Sign up'

    expect(page).to have_content('Subdomain can only contain alphanumeric characters and dashes.')

  end

  scenario 'Uniqueness testing has to be case insensitive' do
    user = FactoryGirl.create(:user, :subdomain => "test")

    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'TEST'
    end
    click_button 'Sign up'

    expect(page).to have_content('Subdomain has already been taken')
  end

end