class AddMilesToFuellogs < ActiveRecord::Migration[5.0]
  def change
    add_column :fuellogs, :miles, :integer
  end
end
