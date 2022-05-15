class AddWarehouseIdToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :warehouse_id, :string
  end
end
