require 'test_helper'

class ServiceLogTest < ActiveSupport::TestCase

  def setup
    @serviceLog = Servicelog.order("odometer").first
  end

  test "should not save unless auto id is filled in" do
    serviceLog = Servicelog.new
    assert !serviceLog.save
    assert serviceLog.errors[:auto_id].include?("can't be blank")
  end
  
  test "should not save unless odometer is filled in" do
    serviceLog = Servicelog.new
    assert !serviceLog.save
    assert serviceLog.errors[:odometer].include?("can't be blank")
  end

  test "should not save unless service type is filled in" do
    serviceLog = Servicelog.new
    assert !serviceLog.save
    assert serviceLog.errors[:service_type_id].include?("can't be blank")
  end
  
end
