class Reminder < ApplicationRecord
  belongs_to :auto
  belongs_to :service_type
  belongs_to :reminder_type
end
