class Servicelog < ApplicationRecord
  belongs_to :auto
  belongs_to :service_type
end
