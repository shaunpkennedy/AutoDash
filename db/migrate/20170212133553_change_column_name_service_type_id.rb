class ChangeColumnNameServiceTypeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :servicelogs, :service_type_id, :servicetype_id
  end
end
