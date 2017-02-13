require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { password: "passworddigest", username: "usercontrollertest" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(User.last)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(User.last)
    assert_response :success
  end

  test "should update user" do
    patch user_url(User.last), params: { user: { password: "newpassworddigest", username: "newusername" } }
    assert_redirected_to user_url(User.last)
  end

  #change to update active flag
  ###test "should destroy user" do
  ###  assert_difference('User.count', -1) do
  ###    delete user_url(@user)
  ###  end
  ###
  ###  assert_redirected_to users_url
  ###end
  
end
