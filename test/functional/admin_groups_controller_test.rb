require 'test_helper'

class AdminGroupsControllerTest < ActionController::TestCase
  setup do
    @admin_group = admin_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_group" do
    assert_difference('AdminGroup.count') do
      post :create, :admin_group => @admin_group.attributes
    end

    assert_redirected_to admin_group_path(assigns(:admin_group))
  end

  test "should show admin_group" do
    get :show, :id => @admin_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_group.to_param
    assert_response :success
  end

  test "should update admin_group" do
    put :update, :id => @admin_group.to_param, :admin_group => @admin_group.attributes
    assert_redirected_to admin_group_path(assigns(:admin_group))
  end

  test "should destroy admin_group" do
    assert_difference('AdminGroup.count', -1) do
      delete :destroy, :id => @admin_group.to_param
    end

    assert_redirected_to admin_groups_path
  end
end
