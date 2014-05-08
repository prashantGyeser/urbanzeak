require 'spec_helper'

feature 'New Experience' do
  scenario 'I should be able to select multiple dates from the datepicker' do
    user = FactoryGirl.create(:user)

    # Logging in
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Login'

    expect(page).to have_content "Signed in successfully."

    # Filling up the form
    visit '/dashboard/experiences/new'
    #page.driver.browser.find_element(:id => 'experience_exp_date').click
    #page.driver.browser.find_element(:class => 'next').click
    #page.driver.browser.find_element(:tag_name => 'td').find_element(:text => '15').click
    #page.driver.browser.find_element(:link_text => '16').click
    #page.driver.browser.find_element(:link_text => '22').click
    #
    #expect(selected_date_count).to eq 3

    fill_in 'experience_name', with: "Bungee jumping"
    fill_in 'experience_tagline', with: "Come jump in the alps with a scenic view"
    fill_in 'experience_what_does_this_include', with: "As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore . . . and this is exploration at its greatest."
    fill_in 'experience_things_to_remember', with: "As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore . . . and this is exploration at its greatest."
    fill_in 'experience_exp_date', with: '05/19/2014,05/27/2014,05/28/2014'
    fill_in 'experience_exp_time', with: '10:00 AM'
    fill_in 'experience_hours', with: 3
    fill_in 'experience_price', with: 12.50
    fill_in 'experience_max_seats', with: 10
    fill_in 'experience_line_one', with: "110 Cross Street"
    fill_in 'experience_city', with: "New York"
    fill_in 'experience_country', with: "United States"

    fill_in 'experience_land_mark', with: "New York, NY, USA"

    click_button "Create Experience"
    expect(page).to have_title "Bungee jumping in "

  end

  scenario 'I should not be able to select more than 4 dates in the datepicker' do
    pending
  end

  scenario 'When I click on the calendar icon I should see the calendar pop up' do
    pending
  end

  scenario 'When I click on the calendar input box I should see the calendar pop up' do
    pending
  end

  scenario 'When I click the next button in the datepicker I should see the next month' do
    pending
  end

  scenario 'The datepicker should start from todays date' do
    pending
  end

  scenario 'Dates before today has to be disabled in the datepicker' do
    pending
  end

  scenario 'I should not be able to select today in the datepicker' do
    pending
  end

  scenario 'When I click on the timepicker the curor should move into the time picker input box' do
    pending
  end

  scenario 'Time format should only allow for a 12 hour clock' do
    pending "The user should not be allowed to put something like 23:00"
  end

  scenario 'I should automatically see the location when I enter a partial landmark' do

    Capybara.current_driver = :selenium

    # Logging in
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'user_email', with: 'capybara@urbanzeak.com'
      fill_in 'user_first_name', with: 'Capybara User'
      fill_in 'user_password', with: 'password@123'
      fill_in 'user_password_confirmation', with: 'password@123'
      fill_in 'user_subdomain', with: 'capybarasubdomain'
    end
    click_button 'Sign up'

    # Filling up the form
    visit '/dashboard/experiences/new'

    fill_in 'experience_land_mark', with: "New York"
    fill_in 'experience_name', with: "Bungee jumping"

    expect(page).to have_content "Report a map error"
    Capybara.use_default_driver       # switch back to default driver

  end

  scenario 'When I start entering a land mark, I should see an autocomplete drop donw' do
    pending
  end

  scenario 'I enter a partial address and directly go click on create experience, it should geocode the partial address' do
    pending
  end

  scenario 'When a user enter a partial landmark and then goes and clicks some other input box' do
    pending
  end

  scenario 'When I start entering a land mark, I should see an autocomplete drop donw' do
    pending
  end

  scenario 'I should be able to move the marker on the map to show the exact location of the experience' do
    pending
  end

  scenario 'Dragging the marker should update the location properly' do
    pending
  end

  scenario 'The map should load when the page opens' do
    pending
  end

  scenario 'When I click on a different link on the nav and then come back to the create form the map should load properly' do
    pending
  end

  scenario 'I should be shown an error message in case I enter invalid data' do

    user = FactoryGirl.create(:user)

    # Logging in
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Login'

    visit '/dashboard/experiences/new'

    fill_in 'experience_tagline', with: "Come jump in the alps with a scenic view"
    fill_in 'experience_what_does_this_include', with: "As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore . . . and this is exploration at its greatest."
    fill_in 'experience_things_to_remember', with: "As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore . . . and this is exploration at its greatest."
    fill_in 'experience_exp_date', with: '05/19/2014,05/27/2014,05/28/2014'
    fill_in 'experience_exp_time', with: '10:00 AM'
    fill_in 'experience_hours', with: 3
    fill_in 'experience_price', with: 12.50
    fill_in 'experience_max_seats', with: 10
    fill_in 'experience_land_mark', with: "New York, NY, USA"

    click_button "Create Experience"
    expect(page).to have_content "Name can't be blank"


  end

  scenario 'When I click select pictures, the filepicker should show up' do
    pending
  end

  scenario 'When I click select pictures and then drag and drop images and then click cancel before the images have uploaded I shoud be able to click select pictures again' do
    pending
  end

  scenario 'When a user completes an upload, the images should be shown in the page' do
    pending
  end

  scenario 'When a user completes an upload, the select pictures button shoul be hiddedn and a delete all pictures button should be shown' do
    pending
  end

  scenario 'I should be able to delete all the pictures after I upload it to modify the images selected' do
    pending
  end

  scenario 'Added images should be stored in the database and shown in the experience show page' do
    pending
  end

  scenario 'Fields should have appropriate validations' do
    pending "Example: Price should be a decimal and max_seats should be an integer"
  end

end