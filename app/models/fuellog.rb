class Fuellog < ApplicationRecord
  belongs_to :auto, required: true
  validates :auto_id, :odometer, :gallons, presence: true
  validates :odometer, uniqueness: {message: "must be unique" }
  after_save :update_auto_odometer
  
  #updates the current odometer based on the saved fuel log
  def update_auto_odometer
    self.auto.update_current_odometer!
  end
  
  ##def self.get_total_cost(auto)
  ##  @totalCost = Fuellog.where(:auto.id => auto.id).sum(:total_cost)
  ##end
  
  ###def self.get_mpg(auto)
  ###  @miles =  Fuellog.where(:auto => auto).sum(:miles)
  ###  @gallons =  Fuellog.where(:auto => auto.sum(:gallons)
  ###
  ###  @miles/@gallons
  ###end
  
end
