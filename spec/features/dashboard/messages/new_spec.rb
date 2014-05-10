require 'spec_helper'
require 'faker'

feature 'When I am on the experience page, I should be able to send the host a message' do

  background do
    user = FactoryGirl.create(:user)
    @experience = FactoryGirl.create(:experience)
    @experience.user_id = user.id
    @experience.save
  end

  scenario 'I should see a send message modal window', :js => true do
    visit experience_path(@experience)
    click_button('ask_a_question_top')
    expect(page).to have_content "Have a question?"
  end

  scenario 'I should be able to send a message with valid details', :js => true do
    visit experience_path(@experience)
    click_button('ask_a_question_top')
    fill_in "message_name", with: Faker::Name.name
    fill_in "message_email", with: Faker::Internet.email
    fill_in "message_body", with: Faker::Lorem.paragraph(2)
    click_button "Send Message"
    # Refer to the following for details on testing a ajax call
    # http://robert-reiz.com/2013/05/21/testing-ajax-with-capybara-and-selenium/
    # Todo: Find out why find is not waiting for the element to appear on the page
    #using_wait_time 10 do
    #  expect(page).to have_content 'Success: Your message was submitted successfully.'
    #end
    #content_to_check = find(:css => "#conversation_created_success")

    # CApybara matchers
    # https://gist.github.com/steveclarke/2353100

    page.document.synchronize( 10 ) do
      element = first('#conversation_created_success')
      if element
        expect(page).to have_content "Your message was submitted successfully."
      else
        raise Capybara::ElementNotFound
      end
    end
    #expect(page).to have_content 'Your message was submitted successfully.'

  end

  scenario 'I should see an error message in case I leave the email field blank', :js => true do
    visit experience_path(@experience)
    click_button('ask_a_question_top')

    fill_in "message_name", with: Faker::Name.name
    fill_in "message_body", with: Faker::Lorem.paragraph(2)

    expect(page).to have_content "Something went wrong"
  end


end