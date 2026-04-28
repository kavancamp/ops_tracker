class CreateInventoryItems < ActiveRecord::Migration[8.1]
  def change
    create_table :inventory_items do |t|
      t.references :location, null: false, foreign_key: true
      t.string :name
      t.integer :quantity
      t.integer :reorder_amount
      t.string :vendor

      t.timestamps
    end
  end
end
