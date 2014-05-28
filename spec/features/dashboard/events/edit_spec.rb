#require 'spec_helper'
#require 'faker'
#
#feature 'New Event' do
#
#  background do
#    user = create(:user)
#
#    visit '/users/sign_in'
#    within('#new_user') do
#      fill_in('user_email', with: user.email)
#      fill_in('user_password', with: user.password)
#    end
#
#    click_button 'Login'
#
#    visit '/dashboard/events/new'
#  end
#
#  scenario 'should be avilable' do
#    expect(page.status_code).to eq 200
#  end
#
#
#  scenario 'created with valid data', :js => true do
#    event_name = Faker::Lorem.word
#    fill_in 'event_name', with: event_name
#    fill_in 'event_tagline', with: Faker::Lorem.sentence(3)
#    fill_in 'event_what_does_this_include', with: Faker::Lorem.paragraph(5)
#    fill_in 'event_things_to_remember', with: Faker::Lorem.paragraph(3)
#    fill_in 'event_price', with: 9.99
#    fill_in 'event_max_seats', with: 6
#    fill_in 'event_dates', with: '05/19/2014,05/27/2014,05/28/2014'
#    fill_in 'event_event_time', with: '10:00 AM'
#    fill_in 'event_line_one', with: Faker::Address.street_name
#    fill_in 'event_city', with: Faker::Address.city
#    fill_in 'event_country', with: Faker::Address.country
#    fill_in 'event_landmark', with: Faker::Address.street_name
#    fill_in 'event_duration', with: 2
#
#    click_link 'file_picker_button'
#
#    within_frame 'filepicker_dialog' do
#      attach_file 'fileUpload', Rails.root.join('spec', 'files', 'photo.jpg'), visible: false
#    end
#
#    #click_button('Edit Event')
#    #
#    #expect(page).to have_content event_name
#    #expect(page).to have_css('img', alt: 'photo.jpg')
#    # Todo: Still need to test if the image is avilable on the page
#    #page.find('#profile-avatar')['src'].should have_content 'default.png'
#    #expect(page)
#  end
#
#end