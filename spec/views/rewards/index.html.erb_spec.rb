require 'spec_helper'

describe "rewards/index" do
  before(:each) do
    assign(:rewards, [
      stub_model(Reward,
        :name => "Name",
        :user_id => 1
      ),
      stub_model(Reward,
        :name => "Name",
        :user_id => 1
      )
    ])
  end

  it "renders a list of rewards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
