require 'test_helper'

class FuellogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"    
  end

  test "should get index" do
    login(@user.username, @user.password)
    get fuellogs_url
    assert_response :success
  end

  test "should get new" do
    login(@user.username, @user.password)
    get new_fuellog_url
    assert_response :success
  end

  test "should create fuellog" do
    assert_difference('Fuellog.count') do
      login(@user.username, @user.password)
      post fuellogs_url, params: { fuellog: { auto_id: Auto.first.id, log_date: "2017-02-11 1:14:11", odometer: 43336, ppg: 1.399, gallons: 13.445, total_cost: 10.99} }
    end
    
    assert_redirected_to fuellog_url(Fuellog.last)
  end

  test "should not create fuellog when missing odometer" do
    assert_no_difference('Fuellog.count') do
      login(@user.username, @user.password)
      post fuellogs_url, params: { fuellog: { auto_id: Auto.first.id, log_date: "2017-02-11 1:14:11", ppg: 1.399, gallons: 13.445, total_cost: 10.99} }
    end
    
    assert_response :success
  end
  
  test "should show fuellog" do
    login(@user.username, @user.password)
    get fuellog_url(Fuellog.last)
    assert_response :success
  end

  test "should get edit" do
    login(@user.username, @user.password)
    get edit_fuellog_url(Fuellog.last)
    assert_response :success
  end

  test "should update fuellog" do
    login(@user.username, @user.password)
    patch fuellog_url(Fuellog.last), params: { fuellog: { auto_id: Auto.first.id, log_date: "2017-02-11 2:14:11", odometer: 42236, ppg: 2.399, gallons: 12.445, total_cost: 22.99 } }
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
    post login_url, params: { username: "controlleruser", password: "controllerpassword" }
  end
    
end
