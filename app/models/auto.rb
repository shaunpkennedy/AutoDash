class Auto < ApplicationRecord
  belongs_to :user
  validates :title, :oil_change_frequency, :tire_rotation_frequency, presence: true
  validates :title, uniqueness: {message: "must be unique" }
end
