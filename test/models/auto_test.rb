require 'test_helper'

class AutoTest < ActiveSupport::TestCase

  def setup
    @auto = autos(:pilot)
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
  
end
