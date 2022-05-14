class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :weight_lb
      t.integer :count

      t.timestamps
    end
  end
end
