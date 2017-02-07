class CreateFuelLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :fuel_logs do |t|
      t.references :auto, foreign_key: true
      t.datetime :log_date
      t.integer :odometer
      t.decimal :ppg
      t.decimal :gallons
      t.decimal :total_cost

      t.timestamps
    end
  end
end
