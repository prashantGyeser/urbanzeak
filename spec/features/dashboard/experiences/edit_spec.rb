require 'spec_helper'
require 'faker'

feature 'Edit Experience' do
  background do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Login'
  end

  scenario 'Update without any changes to the values' do
    experience = FactoryGirl.create(:experience)

    visit "/dashboard/experiences/#{experience.id}/edit"
    click_button 'Update Experience'
    expect(page).to have_content "Experience was successfully updated."

  end

  scenario 'Update after changing the tagline', :js => true do
    experience = FactoryGirl.create(:experience)

    visit "/dashboard/experiences/#{experience.id}/edit"
    fill_in 'experience_exp_date', with: '05/19/2014,05/27/2014,05/28/2014'
    modified_tagline = Faker::Lorem.sentence(5)
    fill_in 'experience_tagline', :with => modified_tagline
    click_button 'Update Experience'
    expect(page).to have_content modified_tagline
  end

  scenario 'The page has a notification telling the user the experience was updated' do
    experience = FactoryGirl.create(:experience)

    visit "/dashboard/experiences/#{experience.id}/edit"
    fill_in 'experience_exp_date', with: '05/19/2014,05/27/2014,05/28/2014'
    modified_tagline = Faker::Lorem.sentence(5)
    fill_in 'experience_tagline', :with => modified_tagline
    click_button 'Update Experience'
    expect(page).to have_content "Experience was successfully updated."
  end

  scenario 'Update the experience after changing the dates' do
    experience = FactoryGirl.create(:experience)

    visit "/dashboard/experiences/#{experience.id}/edit"
    fill_in 'experience_exp_date', with: '05/19/2014,05/27/2014,05/29/2014'
    click_button 'Update Experience'
    expect(page).to have_content "Experience was successfully updated."
  end

  scenario 'Update the experience after changing the landmark', :js => true do
    pending
  end

  scenario 'The landmark field should geocode when a user clicks out of the input box', :js => true do
    #experience = FactoryGirl.create(:experience)
    #
    #visit "/dashboard/experiences/#{experience.id}/edit"
    #fill_in 'experience_land_mark', with: 'new york'
    #click_button 'Update Experience'
    ##expect(page).to have_css('#internal_experience_landmark', visible: false, text: "New York, NY, USA" )
    #page.should have_css('#internal_experience_landmark', visible: false, text: 'New York, NY, USA')


  end

  scenario 'back button should work' do
    pending
  end

  scenario '' do
    pending
  end

  scenario '' do
    pending
  end

  scenario 'When the max seats change it should be reflected in the show page' do
    pending
  end

  scenario 'Versioning for the price, should be reflected in the dashboard' do
    pending
  end

  scenario 'There should be a link to the profile edit page on the experience show page' do
    pending
  end

end