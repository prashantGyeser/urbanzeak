require 'spec_helper'

describe "experiences/index" do
  before(:each) do
    assign(:experiences, [
      stub_model(Experience,
        :name => "Name",
        :description => "MyText",
        :price => "9.99",
        :latitude => 1.5,
        :longitude => 1.5,
        :max_seats => 1
      ),
      stub_model(Experience,
        :name => "Name",
        :description => "MyText",
        :price => "9.99",
        :latitude => 1.5,
        :longitude => 1.5,
        :max_seats => 1
      )
    ])
  end

  it "renders a list of experiences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
