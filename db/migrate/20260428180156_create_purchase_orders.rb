class CreatePurchaseOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :purchase_orders do |t|
      t.references :inventory_item, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :vendor
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
