class Fuellog < ApplicationRecord
  belongs_to :auto, required: true
  validates :auto_id, :odometer, :gallons, presence: true
  validates :odometer, uniqueness: {message: "must be unique" }
  
  
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
