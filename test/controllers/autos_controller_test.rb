require 'test_helper'

class AutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"
  end

  test "should get index" do
    login(@user.username, @user.password)
    get autos_url
    assert_response :success
  end

  test "should get new" do
    login(@user.username, @user.password)
    get new_auto_url
    assert_response :success
  end

  test "should create auto" do
    assert_difference('Auto.count') do
      login(@user.username, @user.password)
      post autos_url, params: { auto: { user_id: @user.id, title: "auto two", oil_change_frequency: 3000, tire_rotation_frequency: 5000 } }
    end
    
    assert_redirected_to auto_url(Auto.last)
  end
  
   test "should not create auto when missing user id" do
    assert_no_difference('Auto.count') do
      login(@user.username, @user.password)
      post autos_url, params: { auto: { title: "auto two", oil_change_frequency: 3000, tire_rotation_frequency: 5000 } }
    end
    
    assert_response :success
  end

  test "should show auto" do
    login(@user.username, @user.password)
    get auto_url(Auto.last)
    assert_response :success
  end

  test "should get edit" do
    login(@user.username, @user.password)
    get edit_auto_url(Auto.last)
    assert_response :success
  end

  test "should update auto" do
    login(@user.username, @user.password)
    patch auto_url(Auto.last), params: { auto: { title: "Modified Controller Auto", make: "Ford", model: "Mustang", current_odometer: 5000 } }
    assert_redirected_to auto_url(Auto.last)
  end

  ####change this to update an active flag
  ###
  ###test "should destroy auto" do
  ### assert_difference('Auto.count', -1) do
  ###  delete auto_url(Auto.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
  ### end
  ### 
  ### assert_redirected_to autos_url
  ###end
  
 private
  def login(username, password)
    post login_url, params: { username: "controlleruser", password: "controllerpassword" }
  end
     
end
