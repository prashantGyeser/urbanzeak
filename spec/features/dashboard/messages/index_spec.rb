require 'spec_helper'
require 'faker'

feature 'Messages List' do

  background do
    @user = FactoryGirl.create(:user)
    experience = FactoryGirl.create(:experience, :user_id => @user.id)
    @conversation = FactoryGirl.create(:conversation, experience_id: experience.id, user_id: @user.id )
    message = FactoryGirl.create(:message, :conversation_id => @conversation.id, :from => @conversation.sender_email_id)

    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
    end
    click_button 'Login'

  end

  scenario 'The messages page should open without any errors' do
    visit '/dashboard/messages'
    expect(page.status_code).to eq 200
  end

  scenario 'I should see a list of conversations on the messages page', :js => true do
    visit '/dashboard/messages'
    expect(page).to have_content "Message from #{@conversation.customer_name}"
  end

  scenario 'I should be able to click on a conversation and see all the messages', :js => true do
    visit '/dashboard/messages'
    find('.clickable', :text => "Message from #{@conversation.customer_name}").click
    expect(page).to have_content(@conversation.sender_email_id)
  end

  scenario 'I should be able to go to a different page from messages' do
    visit '/dashboard/messages'
    find('#experiences_nav').click
    expect(page).to have_content "Experiences"
    end

  scenario 'I should see the messages when I go to another page and come back', :js => true do
    visit '/dashboard/messages'
    find('#experiences_nav').click
    find('#messages_nav').click
    find('.clickable', :text => "Message from #{@conversation.customer_name}").click
    sleep(1)
    expect(page).to have_content(@conversation.sender_email_id)
  end

  scenario 'I should be able to reply' do
    pending 'Clicking on the conversation does not open up the conversation. Still need to find out why that is happening and fix it.'
    visit '/dashboard/messages'
    find('.clickable', :text => "Message from #{@conversation.customer_name}").click
    sleep(1)
    fill_in('messages_body', with: Faker::Lorem.sentence(5))
  end

  scenario 'I should be able to see the conversations when I logout and login and go to the messages page', :js => true do
    visit '/dashboard/messages'
    click_link('Logout')

    click_link('Login')
    within('#new_user') do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
    end
    click_button 'Login'

    find('#messages_nav').click

    find('.clickable', :text => "Message from #{@conversation.customer_name}").click
    sleep(1)
    expect(page).to have_content(@conversation.sender_email_id)
  end

  scenario 'I should see a list of conversations on the messages page in the following order: latest to oldest', :js => true do
    pending
  end

  scenario 'I should be able to close all the messages in case it is open' do
    pending
  end

  scenario 'I should be able to reply to a message' do
    pending
  end

  scenario 'When I click the icon, the conversation list to expand' do
    pending
  end

  scenario 'The input box should be a text area' do
    pending
  end

  scenario 'Clicking the reply button should send out the messages' do
    pending
  end

  scenario 'When I reply the end customer should get an email with my reply' do
    pending
  end

  scenario 'When an end customer sends me a message I should see it in my list of conversations' do
    pending
  end

end