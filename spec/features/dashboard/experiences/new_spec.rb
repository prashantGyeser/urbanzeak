require 'spec_helper'

feature 'New Experience' do
  scenario 'I should be able to select multiple dates from the datepicker' do
    User.create(:email => 'selinium@urbanzeak.com', :password => 'password@123', :password_confirmation => 'password@123')

    Capybara.current_driver = :selenium

    # Logging in
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: 'capybara@urbanzeak.com'
      fill_in 'user_first_name', with: 'Capybara User'
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'capybarasubdomain'
    end
    click_button 'Sign up'

    # Filling up the form
    visit '/dashboard/experiences/new'
    page.driver.browser.find_element(:id => 'experience_exp_date').click
    page.driver.browser.find_element(:class => 'next').click
    page.driver.browser.find_element(:tag_name => 'td').find_element(:text => '15').click
    page.driver.browser.find_element(:link_text => '16').click
    page.driver.browser.find_element(:link_text => '22').click

    expect(selected_date_count).to eq 3

    Capybara.use_default_driver       # switch back to default driver
  end
end