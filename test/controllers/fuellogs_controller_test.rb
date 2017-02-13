require 'test_helper'

class FuellogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"
  end

  test "should get index" do
    get fuellogs_url, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should get new" do
    get new_fuellog_url, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should create fuellog" do
    assert_difference('Fuellog.count') do
      post fuellogs_url, params: { fuellog: { auto_id: Auto.first.id, log_date: "2017-02-11 1:14:11", odometer: 43336, ppg: 1.399, gallons: 13.445, total_cost: 10.99} }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    end
    
    assert_redirected_to fuellog_url(Fuellog.last)
  end

  test "should not create fuellog when missing odometer" do
    assert_no_difference('Fuellog.count') do
      post fuellogs_url, params: { fuellog: { auto_id: Auto.first.id, log_date: "2017-02-11 1:14:11", ppg: 1.399, gallons: 13.445, total_cost: 10.99} }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    end
    
    assert_response :success
  end
  
  test "should show fuellog" do
    get fuellog_url(Fuellog.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should get edit" do
    get edit_fuellog_url(Fuellog.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should update fuellog" do
    patch fuellog_url(Fuellog.last), params: { fuellog: { auto_id: Auto.first.id, log_date: "2017-02-11 2:14:11", odometer: 42236, ppg: 2.399, gallons: 12.445, total_cost: 22.99 } }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_redirected_to fuellog_url(Fuellog.last)
  end

  ####change this to update an active flag
  ###
  ###test "should destroy fuellog" do
  ### assert_difference('Fuellog.count', -1) do
  ###  delete fuellog_url(Fuellog.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
  ### end
  ### 
  ### assert_redirected_to fuellogs_url
  ###end
  
 private
  def login(username, password)
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
  end
  
end
