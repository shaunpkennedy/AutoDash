class Fuellog < ApplicationRecord
  belongs_to :auto, required: true
  validates :auto_id, :odometer, :gallons, presence: true
  validates :odometer, uniqueness: {message: "must be unique" }
  ###before_save :set_miles
  ###before_save :set_mpg
  after_save :update_auto_odometer
  
  
  
  ####calculate and set miles based on current and last odometer readings
  ###def set_miles
  ###  self.miles = self.odometer - Fuellog.last.odometer
  ###end
  ###
  ####calculate and set mpg
  ###def set_mpg
  ###  self.mpg = (self.miles / self.gallons).round(1)
  ###end  
  
  #updates the current odometer based on the saved fuel log
  def update_auto_odometer
    self.auto.update_current_odometer!
  end
  
end
