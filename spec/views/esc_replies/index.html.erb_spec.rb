require 'spec_helper'

describe "esc_replies/index.html.erb" do
  before(:each) do
    assign(:esc_replies, [
      stub_model(EscReply,
        :esc_id => 1,
        :replier => 1,
        :content => "MyText",
        :status_changed_info => "Status Changed Info"
      ),
      stub_model(EscReply,
        :esc_id => 1,
        :replier => 1,
        :content => "MyText",
        :status_changed_info => "Status Changed Info"
      )
    ])
  end

  it "renders a list of esc_replies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status Changed Info".to_s, :count => 2
  end
end
