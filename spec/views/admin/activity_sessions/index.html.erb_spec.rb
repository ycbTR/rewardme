require 'spec_helper'

describe "admin/activity_sessions/index" do
  before(:each) do
    assign(:admin_activity_sessions, [
      stub_model(Admin::ActivitySession),
      stub_model(Admin::ActivitySession)
    ])
  end

  it "renders a list of admin/activity_sessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
