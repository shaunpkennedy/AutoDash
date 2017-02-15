require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"
  end
  
  test "should get index" do
    login(@user.username, @user.password)
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
    login(@user.username, @user.password)
    get user_url(User.last)
    assert_response :success
  end

  test "should get edit" do
    login(@user.username, @user.password)
    get edit_user_url(User.last)
    assert_response :success
  end

  test "should update user" do
    login(@user.username, @user.password)
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
 
 private
  def login(username, password)
    post login_url, params: { username: "controlleruser", password: "controllerpassword" }
  end
   
end
