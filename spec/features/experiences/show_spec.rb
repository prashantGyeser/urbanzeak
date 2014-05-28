require 'spec_helper'

feature 'Experiences' do

  background do
    user = FactoryGirl.create(:user)
    @experience = FactoryGirl.create(:experience, :user_id => user.id)
    @about = create(:host, user_id: user.id)
  end

  scenario 'Show page should open' do
    visit experience_path(@experience)
    expect(page.status_code).to eq 200
  end

  scenario 'Show' do
    visit experience_path(@experience)
    expect(page).to have_content @experience.name
  end

  scenario 'Create Review' do
    visit experience_path(@experience)
    pending "Need to test out the review functionality"
    #click_button('leave_review')
    #
    #expect(page).to have_content 'Leave a review for this experience'

  end

end