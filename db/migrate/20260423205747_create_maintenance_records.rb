class CreateMaintenanceRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :maintenance_records do |t|
      t.references :asset, null: false, foreign_key: true
      t.datetime :performed_at
      t.string :vendor
      t.decimal :cost
      t.text :notes

      t.timestamps
    end
  end
end
