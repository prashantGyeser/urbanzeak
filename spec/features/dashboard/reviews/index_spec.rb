require 'spec_helper'

feature 'Reviews' do

  background do
    user = FactoryGirl.create(:user)
    @experience = FactoryGirl.create(:experience, :user_id => user.id)
    @review = FactoryGirl.create(:review, :experience_id => @experience.id)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Login'
  end

  scenario 'See the reviews page' do
    find('#reviews_nav').click
    expect(page).to have_content "Reviews"
  end

  scenario 'See all reviews' do
    find('#reviews_nav').click
    expect(page).to have_content @review.comment
  end

  scenario 'Selected review should show on the experience show page', :js => true do
    pending 'Clicking on the review in the experience should show it on the experience show page'
  end

  scenario 'Selecting a review should show a message telling me the review is shown on the experience show page' do
    pending
  end

end