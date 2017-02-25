class Auto < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, presence: true
  validates :title, uniqueness: {message: "must be unique" }
  has_many :fuellogs
  has_many :servicelogs
  
  def get_fuel_total_cost
    self.fuellogs.sum(:total_cost)
  end

  def get_miles_logged
    @miles = self.fuellogs.sum(:miles)
  end  
  
  def get_service_total_cost
    self.servicelogs.sum(:total_cost)
  end
  
  def get_overall_mpg
    @miles =  get_miles_logged
    @gallons =  self.fuellogs.sum(:gallons)
    @mpg = @miles/@gallons  
    @mpg.round(1)
  end
  
  def get_most_recent_mpg
    @fuellog = self.fuellogs.order("log_date").last
    @fuellog.mpg
  end
  
  #def get_previous_mpg
  #  @fuellog = self.fuellogs.order("log_date").offset(1).last
  #  @fuellog.mpg
  #end
  
  def get_cost_per_mile
    @miles = get_miles_logged
    @cost = get_fuel_total_cost
    @costPerMile = @cost/@miles
    @costPerMile.round(3)    
  end
  
  def get_best_mpg
    @mpg = self.fuellogs.maximum(:mpg)
  end
  

  
end
