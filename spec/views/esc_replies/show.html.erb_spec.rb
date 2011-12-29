require 'spec_helper'

describe "esc_replies/show.html.erb" do
  before(:each) do
    @esc_reply = assign(:esc_reply, stub_model(EscReply,
      :esc_id => 1,
      :replier => 1,
      :content => "MyText",
      :status_changed_info => "Status Changed Info"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status Changed Info/)
  end
end
