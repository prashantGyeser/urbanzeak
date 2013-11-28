require 'spec_helper'

describe "experiences/new" do
  before(:each) do
    assign(:experience, stub_model(Experience,
      :name => "MyString",
      :description => "MyText",
      :price => "9.99",
      :latitude => 1.5,
      :longitude => 1.5,
      :max_seats => 1
    ).as_new_record)
  end

  it "renders new experience form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", experiences_path, "post" do
      assert_select "input#experience_name[name=?]", "experience[name]"
      assert_select "textarea#experience_description[name=?]", "experience[description]"
      assert_select "input#experience_price[name=?]", "experience[price]"
      assert_select "input#experience_latitude[name=?]", "experience[latitude]"
      assert_select "input#experience_longitude[name=?]", "experience[longitude]"
      assert_select "input#experience_max_seats[name=?]", "experience[max_seats]"
    end
  end
end
