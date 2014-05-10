require 'spec_helper'

feature 'Experiences' do

  background do
    user = FactoryGirl.create(:user)
    @experience = FactoryGirl.create(:experience, :user_id => user.id)
  end

  scenario 'Show page should open' do
    visit experience_path(@experience)
    expect(page.status_code).to eq 200
  end

  scenario 'Show' do
    visit experience_path(@experience)
    expect(page).to have_content @experience.name
  end
end