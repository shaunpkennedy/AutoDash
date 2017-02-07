class CreateServiceLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :service_logs do |t|
      t.references :auto, foreign_key: true
      t.datetime :log_date
      t.references :service_type, foreign_key: true
      t.integer :odometer
      t.decimal :total_cost
      t.text :notes

      t.timestamps
    end
  end
end
