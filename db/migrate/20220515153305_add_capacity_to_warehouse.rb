class AddCapacityToWarehouse < ActiveRecord::Migration[6.0]
  def change
    add_column :warehouses, :capacity, :integer
  end
end
