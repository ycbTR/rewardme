require 'spec_helper'

describe "rewards/new" do
  before(:each) do
    assign(:reward, stub_model(Reward,
      :name => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new reward form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rewards_path, "post" do
      assert_select "input#reward_name[name=?]", "reward[name]"
      assert_select "input#reward_user_id[name=?]", "reward[user_id]"
    end
  end
end
