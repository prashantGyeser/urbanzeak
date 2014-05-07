require 'spec_helper'

feature 'I should be able to see and reply to messages' do

  background do
    user = FactoryGirl.create(:user)
    experience = FactoryGirl.create(:experience, :user_id => user.id)
    @conversation = FactoryGirl.create(:conversation, experience_id: experience.id, user_id: user.id )
    message = FactoryGirl.create(:message, :conversation_id => @conversation.id, :from => @conversation.sender_email_id)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Login'
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

  scenario 'I should see the messages when I go to another page and come back', :js => true do
    visit '/dashboard/messages'
    find('#experiences_nav').click
    #find(:xpath, "//a[@href='/dashboard/experiences']").click
  end

end