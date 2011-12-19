require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login_no => "MyString",
      :password => "MyString",
      :status => 1,
      :type => 1,
      :question => "MyString",
      :answer => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_login_no", :name => "user[login_no]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_status", :name => "user[status]"
      assert_select "input#user_type", :name => "user[type]"
      assert_select "input#user_question", :name => "user[question]"
      assert_select "input#user_answer", :name => "user[answer]"
    end
  end
end
