require 'test_helper'

class AutoTest < ActiveSupport::TestCase

  def setup
    @auto = autos(:pilot)
    
    #MPG testing
    @kia = autos(:kia)
    @kia.fuellogs << fuellogs(:kiaFillUp1)
    @kia.fuellogs << fuellogs(:kiaFillUp2)
    @kia.fuellogs << fuellogs(:kiaFillUp3)
    @kia.fuellogs << fuellogs(:kiaFillUp4)
    @kia.fuellogs << fuellogs(:kiaFillUp5)
    @kia.fuellogs << fuellogs(:kiaFillUp6)
    
  end

  test "should not save unless user id is filled in" do
    auto = Auto.new
    assert !auto.save
    assert auto.errors[:user_id].include?("can't be blank")
  end
  
  test "should not save unless title is filled in" do
    auto = Auto.new
    assert !auto.save
    assert auto.errors[:title].include?("can't be blank")
  end
  
  test "should only have one auto with the same name" do
    auto = Auto.new(:title =>"Test Car Two")
    auto.save
    auto.valid?
    assert auto.errors[:title].include?("must be unique")
  end
 
  test "association of one auto and one fuel log" do
    @auto.fuellogs << fuellogs(:fillup)
    @auto.save
    
    assert_equal 1, @auto.reload.fuellogs.size
  end
  
  test "association of one auto and two service logs" do
  
    @auto.servicelogs << servicelogs(:walmartoilchange)
    @auto.servicelogs << servicelogs(:samstirerotation)
    @auto.save
    
    assert_equal 2, @auto.reload.servicelogs.size
  end 
  
  test "should calculate total fuel cost correctly" do
    @totalCost = @kia.get_fuel_total_cost     
    assert_equal(147.59, @totalCost)
  end  
  
  test "should return total miles logged" do
    @miles = @kia.get_miles_logged
    assert_equal(1813, @miles)
  end
  
  test "should calculate overall miles per gallon correctly" do
    @mpg = @kia.get_overall_mpg
    assert_equal(29.2, @mpg)
  end
  
  test "should return most recent mpg" do  
    @mostRecentMpg = @kia.get_most_recent_mpg
    assert_equal(30.9, @mostRecentMpg)  
  end  
  
  #test "should return previous mpg" do  
  #  @previousMpg = @kia.get_previous_mpg
  #  assert_equal(@previousMpg, 19.4)  
  #end
  
  test "should calculate cost per mile" do
    @costPerMile = @kia.get_cost_per_mile
    assert_equal(0.081, @costPerMile)
  end
  
  test "should return difference between most recent two mpg's" do
  end
  
  test "should return best/highest mpg" do
    @mpg = @kia.get_best_mpg    
    assert_equal(62.6, @mpg)
  
  end
  
  test "should return miles to next oil change" do
  end
  
  test "should return miles to next tire rotation" do
  end
  
  
  test "should calculate service total cost" do  
  end
    
end
