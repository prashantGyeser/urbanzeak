require 'spec_helper'

describe "experiences/show" do
  before(:each) do
    @experience = assign(:experience, stub_model(Experience,
      :name => "Name",
      :description => "MyText",
      :price => "9.99",
      :latitude => 1.5,
      :longitude => 1.5,
      :max_seats => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
  end
end
