class Reminder < ApplicationRecord
  belongs_to :auto, required: true
  belongs_to :service_type, required: true
  belongs_to :reminder_type
  validates :auto_id, :service_type_id, presence: true 
end
