require 'test_helper'

class FuellogTest < ActiveSupport::TestCase

  test "should not save unless auto id is filled in" do
    fuellog = Fuellog.new
    assert !fuellog.save
    assert fuellog.errors[:auto_id].include?("can't be blank")
  end
  
  test "should not save unless odometer is filled in" do
    fuellog = Fuellog.new
    assert !fuellog.save
    assert fuellog.errors[:odometer].include?("can't be blank")
  end

  test "should not save unless gallons is filled in" do
    fuellog = Fuellog.new
    assert !fuellog.save
    assert fuellog.errors[:gallons].include?("can't be blank")
  end
  
  test "should only have one fuellog with the same name" do
    aOdometer = fuellogs(:siennafillup).odometer
    fuellog = Fuellog.new(:odometer => aOdometer)
    fuellog.save
    fuellog.valid?
    assert fuellog.errors[:odometer].include?("must be unique")
  end
  
end
