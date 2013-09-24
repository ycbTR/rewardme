require 'spec_helper'

describe "admin/activity_sessions/new" do
  before(:each) do
    assign(:admin_activity_session, stub_model(Admin::ActivitySession).as_new_record)
  end

  it "renders new admin_activity_session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_activity_sessions_path, "post" do
    end
  end
end
