class CreateAssets < ActiveRecord::Migration[8.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :asset_type
      t.string :serial_number
      t.string :status
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
