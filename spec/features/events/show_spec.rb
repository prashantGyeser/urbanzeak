require 'spec_helper'

feature 'Event Show' do
  background do
    user = create(:user)
    @event = create(:event, user: user)
    visit event_path(@event)
  end

  scenario 'Page should show' do
    expect(page.status_code).to eq 200
  end

  scenario 'Should have the event name' do
    expect(page).to have_content @event.name
  end


end