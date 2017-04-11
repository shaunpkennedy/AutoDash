class Reminder < ApplicationRecord
  belongs_to :auto
  belongs_to :service_type
  belongs_to :reminder_type
  validates :auto_id, :service_type_id, presence: true 
end
