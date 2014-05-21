require 'test_helper'

class SysUsersControllerTest < ActionController::TestCase
  setup do
    @sys_user = sys_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sys_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sys_user" do
    assert_difference('SysUser.count') do
      post :create, sys_user: { name: @sys_user.name, phone: @sys_user.phone, photo: @sys_user.photo, pwd: @sys_user.pwd, sex: @sys_user.sex }
    end

    assert_redirected_to sys_user_path(assigns(:sys_user))
  end

  test "should show sys_user" do
    get :show, id: @sys_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sys_user
    assert_response :success
  end

  test "should update sys_user" do
    patch :update, id: @sys_user, sys_user: { name: @sys_user.name, phone: @sys_user.phone, photo: @sys_user.photo, pwd: @sys_user.pwd, sex: @sys_user.sex }
    assert_redirected_to sys_user_path(assigns(:sys_user))
  end

  test "should destroy sys_user" do
    assert_difference('SysUser.count', -1) do
      delete :destroy, id: @sys_user
    end

    assert_redirected_to sys_users_path
  end
end
