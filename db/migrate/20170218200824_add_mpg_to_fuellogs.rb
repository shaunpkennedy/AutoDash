class AddMpgToFuellogs < ActiveRecord::Migration[5.0]
  def change
    add_column :fuellogs, :mpg, :decimal
  end
end
