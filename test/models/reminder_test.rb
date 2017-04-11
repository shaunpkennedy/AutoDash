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
  
end
