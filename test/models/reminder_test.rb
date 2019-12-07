require 'test_helper'

class ReminderTest < ActiveSupport::TestCase

  test "reminder - should not save unless auto id is filled in" do
    reminder = Reminder.new
    assert !reminder.save
    assert reminder.errors[:auto_id].include?("can't be blank")
  end
  
  test "should not save unless service type id is filled in" do
    reminder = Reminder.new
    assert !reminder.save
    assert reminder.errors[:service_type_id].include?("can't be blank")
  end
  
  test "should determine miles remaining for reminder" do
    a = Auto.new
    a.user = User.first
    a.title = "Test remaining reminder miles"
    a.current_odometer = 49000
    
    r = reminders(:oilChangeReminder)
    r.auto = a
    r.miles = 5000
    r.next_odometer = 50000

    puts a.title
    puts a.current_odometer
    
    assert_equal(1000, r.miles_remaining)
    
  end
  
end
