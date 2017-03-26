class Servicelog < ApplicationRecord
  belongs_to :auto, required: true
  belongs_to :service_type, required: true
  validates :auto_id, :odometer, :service_type_id, presence: true
    after_save :update_auto_odometer
  
  #updates the current odometer based on the saved fuel log
  def update_auto_odometer
    self.auto.update_current_odometer!
  end
  
end
