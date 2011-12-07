require 'test_helper'

class AdminGroupTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "admin_group attributes must not be empty" do
    admin_group = AdminGroup.new
    assert admin_group.invalid?
    assert admin_group.errors[:group_no].any?
    assert admin_group.errors[:group_name].any?
  end
end
