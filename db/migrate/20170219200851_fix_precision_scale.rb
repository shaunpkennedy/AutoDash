class FixPrecisionScale < ActiveRecord::Migration[5.0]
  def change
    change_column :fuellogs, :ppg, :decimal, :precision => 6, :scale => 3
    change_column :fuellogs, :gallons, :decimal, :precision => 6, :scale => 3
    change_column :fuellogs, :total_cost, :decimal, :precision => 5, :scale => 2
    change_column :fuellogs, :mpg, :decimal, :precision => 4, :scale => 1
    change_column :servicelogs, :total_cost, :decimal, :precision => 5, :scale => 2  
  end
end
