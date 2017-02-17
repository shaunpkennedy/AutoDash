class Fuellog < ApplicationRecord
  belongs_to :auto, required: true
  validates :auto_id, :odometer, :gallons, presence: true
  validates :odometer, uniqueness: {message: "must be unique" }
end
