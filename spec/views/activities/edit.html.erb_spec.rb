require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :description => "MyText",
      :user_id => 1,
      :activity_session_id => 1,
      :star => 1
    ))
  end

  it "renders the edit activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do
      assert_select "textarea#activity_description[name=?]", "activity[description]"
      assert_select "input#activity_user_id[name=?]", "activity[user_id]"
      assert_select "input#activity_activity_session_id[name=?]", "activity[activity_session_id]"
      assert_select "input#activity_star[name=?]", "activity[star]"
    end
  end
end
