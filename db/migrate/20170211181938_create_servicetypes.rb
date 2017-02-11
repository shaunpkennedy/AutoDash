class CreateServicetypes < ActiveRecord::Migration[5.0]
  def change
    create_table :servicetypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
