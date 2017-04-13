require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create :username => "controlleruser", :password => "controllerpassword", :password_confirmation =>  "controllerpassword"    
  end

  test "should get index" do
    login(@user.username, @user.password)
    get reminders_url
    assert_response :success
  end

  test "should get new" do
    login(@user.username, @user.password)
    get new_reminder_url
    assert_response :success
  end

  test "should create reminder" do
    assert_difference('Reminder.count') do
      login(@user.username, @user.password)
      post reminders_url, params: { reminder: { auto_id: Auto.first.id, service_type_id: ServiceType.first.id, reminder_type_id: ReminderType.first.id, miles: 5000 } }
    end
    
    assert_redirected_to reminder_url(Reminder.last)
  end

  test "should not create reminder when missing auto id" do
    assert_no_difference('Reminder.count') do
      login(@user.username, @user.password)
      post reminders_url, params: { reminder: { service_type_id: ServiceType.first.id, reminder_type_id: ReminderType.first.id, miles: 5000 } }
    end
    
    assert_response :success
  end
  
  test "should not create reminder when missing service type" do
    assert_no_difference('Reminder.count') do
      login(@user.username, @user.password)
      post reminders_url, params: { reminder: { auto_id: Auto.first.id, reminder_type_id: ReminderType.first.id, miles: 5000 } }
    end
    
    assert_response :success
  end  
  
  test "should show reminder" do
    login(@user.username, @user.password)
    get reminder_url(Reminder.last)
    assert_response :success
  end

  test "should get edit" do
    login(@user.username, @user.password)
    get edit_reminder_url(Reminder.last)
    assert_response :success
  end

  test "should update reminder" do
    login(@user.username, @user.password)
    patch reminder_url(Reminder.last), params: { reminder: { auto_id: Auto.first.id, service_type_id: ServiceType.first.id, miles: 7500 } }
    assert_redirected_to reminder_url(Reminder.last)
  end


 private
 
  def login(username, password)
    post login_url, params: { username: "controlleruser", password: "controllerpassword" }
  end
    
end
