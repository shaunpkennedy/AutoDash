class Reminder < ApplicationRecord
  belongs_to :auto, required: true
  belongs_to :service_type, required: true
  belongs_to :reminder_type
  validates :auto_id, :service_type_id, presence: true 
  
  def miles_remaining
    @miles_remaining = self.next_odometer - self.auto.current_odometer
  end
  
  def days_remaining
  end
  
end
