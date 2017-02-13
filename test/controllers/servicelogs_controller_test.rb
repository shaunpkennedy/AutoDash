require 'test_helper'

class ServicelogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"
  end

  test "should get index" do
    get servicelogs_url, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should get new" do
    get new_servicelog_url, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should create servicelog" do
    assert_difference('Servicelog.count') do
      post servicelogs_url, params: { servicelog: { auto_id: Auto.first.id, log_date: "2017-02-12 2:01:01", service_type_id: ServiceType.first.id, total_cost: 10.99} }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    end
    
    assert_redirected_to servicelog_url(Servicelog.last)
  end

  test "should show servicelog" do
    get servicelog_url(Servicelog.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should get edit" do
    get edit_servicelog_url(Servicelog.last), headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
    assert_response :success
  end

  test "should update servicelog" do
    patch servicelog_url(Servicelog.last), params: { servicelog: { auto_id: Auto.first.id, log_date: "2017-02-12 2:14:11", service_type_id: ServiceType.last.id, total_cost: 19.99, notes: "controller test note" } }, headers: {'HTTP_AUTHORIZATION' => login("controlleruser", "controllerpassword") }
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
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
  end
  
end
