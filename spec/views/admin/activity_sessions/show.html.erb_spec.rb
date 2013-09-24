require 'spec_helper'

describe "admin/activity_sessions/show" do
  before(:each) do
    @activity_session = assign(:admin_activity_session, stub_model(Admin::ActivitySession))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
