class Servicelog < ApplicationRecord
  belongs_to :auto
  has_one :servicetype
  validates :auto_id, :odometer, :service_type_id, presence: true
end
