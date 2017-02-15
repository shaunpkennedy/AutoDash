require 'test_helper'

class ServicelogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"
  end

  test "should get index" do    
    login(@user.username, @user.password)
    get servicelogs_url
    assert_response :success
  end

  test "should get new" do    
    login(@user.username, @user.password)
    get new_servicelog_url
    assert_response :success
  end

  test "should create servicelog" do
    assert_difference('Servicelog.count') do    
      login(@user.username, @user.password)
      post servicelogs_url, params: { servicelog: { auto_id: Auto.first.id, log_date: "2017-02-12 2:01:01", odometer: 69875, service_type_id: ServiceType.first.id, total_cost: 10.99} }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    end
    
    assert_redirected_to servicelog_url(Servicelog.last)
  end
  
  test "should not create servicelog when missing auto id" do
    assert_no_difference('Servicelog.count') do    
      login(@user.username, @user.password)
      post servicelogs_url, params: { servicelog: { log_date: "2017-02-12 2:01:01", odometer: 69875, service_type_id: ServiceType.first.id, total_cost: 10.99} }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    end
    
    assert_response :success
  end  

  test "should show servicelog" do    
    login(@user.username, @user.password)
    get servicelog_url(Servicelog.last)
    assert_response :success
  end

  test "should get edit" do    
    login(@user.username, @user.password)
    get edit_servicelog_url(Servicelog.last)
    assert_response :success
  end

  test "should update servicelog" do    
    login(@user.username, @user.password)
    patch servicelog_url(Servicelog.last), params: { servicelog: { auto_id: Auto.first.id, log_date: "2017-02-12 2:14:11", service_type_id: ServiceType.last.id, total_cost: 19.99, notes: "controller test note" } }
    assert_redirected_to servicelog_url(Servicelog.last)
  end

  ####change this to update an active flag
  ###
  ###test "should destroy servicelog" do
  ### assert_difference('Servicelog.count', -1) do
  ###  delete servicelog_url(Servicelog.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
  ### end
  ### 
  ### assert_redirected_to servicelogs_url
  ###end
  
 private
  def login(username, password)
    post login_url, params: { username: "controlleruser", password: "controllerpassword" }
  end  
  
end
