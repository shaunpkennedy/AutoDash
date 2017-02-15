require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should get logout" do
    get logout_url
    assert_redirected_to login_url
  end
  
  test "should get signup" do
    get signup_url
    assert_response :success
  end
  
end
