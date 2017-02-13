class Fuellog < ApplicationRecord
  belongs_to :auto
  validates :auto_id, :odometer, :gallons, presence: true
  validates :odometer, uniqueness: {message: "must be unique" }
end
