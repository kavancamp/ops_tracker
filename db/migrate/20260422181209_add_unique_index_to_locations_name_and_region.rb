class AddUniqueIndexToLocationsNameAndRegion < ActiveRecord::Migration[8.1]
  def change
    add_index :locations, [ :name, :region ], unique: true
  end
end