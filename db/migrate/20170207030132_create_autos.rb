class CreateAutos < ActiveRecord::Migration[5.0]
  def change
    create_table :autos do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :make
      t.string :model
      t.integer :auto_year
      t.integer :current_odometer
      t.integer :oil_change_frequency
      t.integer :tire_rotation_frequency

      t.timestamps
    end
  end
end
