class Auto < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, presence: true
  validates :title, uniqueness: {message: "must be unique" }
  has_many :fuellogs
  has_many :servicelogs
end
