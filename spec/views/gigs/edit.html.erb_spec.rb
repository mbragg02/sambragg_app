require 'spec_helper'

describe "gigs/edit.html.erb" do
  before(:each) do
    @gig = assign(:gig, stub_model(Gig,
      :name => "MyString",
      :address => "MyText",
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders the edit gig form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gigs_path(@gig), :method => "post" do
      assert_select "input#gig_name", :name => "gig[name]"
      assert_select "textarea#gig_address", :name => "gig[address]"
      assert_select "input#gig_lat", :name => "gig[lat]"
      assert_select "input#gig_lng", :name => "gig[lng]"
    end
  end
end
