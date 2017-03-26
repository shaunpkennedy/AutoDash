class Auto < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, presence: true
  validates :title, uniqueness: {message: "must be unique" }
  has_many :fuellogs
  has_many :servicelogs
  
  #TODO: this could change where we don't update/save odometer, but odometer is always pulled using similar logic
  def update_current_odometer!
    @lastFuelLogOdometer = self.fuellogs.maximum(:odometer).to_i
    @lastServiceLogOdometer =self.servicelogs.maximum(:odometer).to_i
    @newOdometer = [@lastFuelLogOdometer, @lastServiceLogOdometer].max
    
    self.update_column(:current_odometer, @newOdometer)
  end
  
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
    
    if (@fuellog)
      @fuellog.mpg
    end
  end
  
  def get_previous_mpg
    @fuellog = self.fuellogs.order("log_date").offset(1).last
    
    if (@fuellog)
      @fuellog.mpg
    end
  end
  
  def get_cost_per_mile
    @miles = get_miles_logged
    @cost = get_fuel_total_cost
    @costPerMile = @cost/@miles
    @costPerMile.round(3)    
  end
  
  def get_average_cost_per_gallon
    @gallons =  self.fuellogs.sum(:gallons)
    @cost = get_fuel_total_cost
    @costPerGallon = @cost/@gallons
    @costPerGallon.round(3)    
  end

  def get_average_cost_per_fill_up
    @fillups = self.fuellogs.count
    @cost = get_fuel_total_cost
    @costPerFillup = @cost/@fillups
    @costPerFillup.round(2)    
  end
  
  def get_best_mpg
    @mpg = self.fuellogs.maximum(:mpg)
  end
  

  
end
