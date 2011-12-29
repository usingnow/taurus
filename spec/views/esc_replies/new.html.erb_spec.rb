require 'spec_helper'

describe "esc_replies/new.html.erb" do
  before(:each) do
    assign(:esc_reply, stub_model(EscReply,
      :esc_id => 1,
      :replier => 1,
      :content => "MyText",
      :status_changed_info => "MyString"
    ).as_new_record)
  end

  it "renders new esc_reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => esc_replies_path, :method => "post" do
      assert_select "input#esc_reply_esc_id", :name => "esc_reply[esc_id]"
      assert_select "input#esc_reply_replier", :name => "esc_reply[replier]"
      assert_select "textarea#esc_reply_content", :name => "esc_reply[content]"
      assert_select "input#esc_reply_status_changed_info", :name => "esc_reply[status_changed_info]"
    end
  end
end
