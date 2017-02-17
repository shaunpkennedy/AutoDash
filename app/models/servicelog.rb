class Servicelog < ApplicationRecord
  belongs_to :auto, required: true
  belongs_to :service_type, required: true
  validates :auto_id, :odometer, :service_type_id, presence: true
end
