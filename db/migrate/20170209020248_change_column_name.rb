class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :autos, :oil_change_frequncy, :oil_change_frequency
  end
end
