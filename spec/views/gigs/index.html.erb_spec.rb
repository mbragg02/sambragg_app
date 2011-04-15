require 'spec_helper'

describe "gigs/index.html.erb" do
  before(:each) do
    assign(:gigs, [
      stub_model(Gig,
        :name => "Name",
        :address => "MyText",
        :lat => 1.5,
        :lng => 1.5
      ),
      stub_model(Gig,
        :name => "Name",
        :address => "MyText",
        :lat => 1.5,
        :lng => 1.5
      )
    ])
  end

  it "renders a list of gigs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
