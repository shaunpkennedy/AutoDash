class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.references :auto, foreign_key: true
      t.references :service_type, foreign_key: true
      t.references :reminder_type, foreign_key: true
      t.integer :miles
      t.integer :time
      t.integer :next_odometer
      t.text :notes

      t.timestamps
    end
  end
end
