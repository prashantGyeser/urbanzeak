require 'spec_helper'

feature 'Events' do
  background do
    user = create(:user)

    visit '/users/sign_in'
    within('#new_user') do
      fill_in('user_email', with: user.email)
      fill_in('user_password', with: user.password)
    end

    click_button ('Login')

    @event = create(:event, :user => user)
    visit '/dashboard/events'
  end

  scenario 'Page should be available' do
    expect(page.status_code).to eq 200
  end

  scenario 'Page should list events' do
    expect(page).to have_content @event.name
  end

  scenario 'Page should have a link to the event show page' do
    pending
    click_link(@event.name)
    expect(page).to have_content @event.name
  end

  scenario 'Page should have the right event url for the share function' do
    pending
  end
end