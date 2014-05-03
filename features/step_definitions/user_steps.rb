def create_user
  fill_in 'user_email', :with => "cucumber@urbanzeak.com"
  fill_in 'user_first_name', :with => "Cucumber Test"
  fill_in 'user_password', :with => "password@123"
  fill_in 'user_password_confirmation', :with => "password@123"
  fill_in 'user_subdomain', :with => "cucumbersubdomain"
  click_button 'Sign up'
end


Given(/^I want to sign up$/) do
  visit '/users/sign_up'
end

When(/^I enter valid details$/) do
  # add this 3 lines for a startup
  # make your delivery state to 'test' mode
  ActionMailer::Base.delivery_method = :test
  # make sure that actionMailer perform an email delivery
  ActionMailer::Base.perform_deliveries = true
  # clear all the email deliveries, so we can easily checking the new ones
  ActionMailer::Base.deliveries.clear
  create_user
end

Then(/^I should see a greeting$/) do
  page.should have_content "Welcome to urbanzeak"
end

When(/^I enter an email that is already registered$/) do
  User.create(:email => 'cucumber@urbanzeak.com', :first_name => 'Cucumber Test', :password => 'password@123', :password_confirmation => 'password@123', :subdomain => 'cucumbersubdomain' )
  create_user
end

Then(/^I should be told the email already exists$/) do
  page.should have_content 'Email has already been taken'
end