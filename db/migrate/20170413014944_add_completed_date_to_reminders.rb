class AddCompletedDateToReminders < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :completed_date, :datetime
  end
end
