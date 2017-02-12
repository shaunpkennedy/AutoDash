class ServiceType < ApplicationRecord
  belongs_to :servicelog, required: true
end
