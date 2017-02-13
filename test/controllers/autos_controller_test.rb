require 'test_helper'

class AutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    #@auto =  Auto.create :user_id => 980190962 :title => "controller auto test", :make => "Chevy", :model =>  "Cavalier", :oil_change_frequency =>  3000, :tire_rotation_frequency =>  10000
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"
  end

  test "should get index" do
    get autos_url, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should get new" do
    get new_auto_url, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should create auto" do
    assert_difference('Auto.count') do
      post autos_url, params: { auto: { user_id: @user.id, title: "auto two", oil_change_frequency: 3000, tire_rotation_frequency: 5000 } }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    end
    
    assert_redirected_to auto_url(Auto.last)
  end

  test "should show auto" do
    get auto_url(Auto.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should get edit" do
    get edit_auto_url(Auto.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should update auto" do
    patch auto_url(Auto.last), params: { auto: { title: "Modified Controller Auto", make: "Ford", model: "Mustang", current_odometer: 5000 } }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
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
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
  end
  
end
