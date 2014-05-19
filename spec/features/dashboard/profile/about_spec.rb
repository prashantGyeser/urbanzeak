require 'spec_helper'
require 'faker'

feature 'About host' do

  background do
    user = FactoryGirl.create(:user)
    # Logging in
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Login'

  end

  scenario 'I should be able to add an about text' do
    visit '/dashboard/profile/about'

    fill_in 'host[name]', :with => Faker::Name.name
    fill_in 'host[about]', :with => Faker::Lorem.sentence

    click_button('Add about')

    expect(page).to have_content "Success: Added your details successfully."

  end

  scenario 'I should be able to upload a photo of mine' do
    pending
  end

  scenario 'I should be able to delete my photo' do
    pending
  end

  scenario 'I should see a notification when I create an about' do
    pending
  end

  scenario 'Once I add an about me section I should not see the link on the experience show page' do
    pending
  end

  scenario 'Output of this form has to be tested' do
    pending
  end
end