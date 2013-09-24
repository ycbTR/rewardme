require 'spec_helper'

describe "admin/activity_sessions/edit" do
  before(:each) do
    @activity_session = assign(:admin_activity_session, stub_model(Admin::ActivitySession))
  end

  it "renders the edit admin_activity_session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_activity_session_path(@activity_session), "post" do
    end
  end
end
