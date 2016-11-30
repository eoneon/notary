class RemoveDetailsFromLocations < ActiveRecord::Migration
  def change
    remove_foreign_key :locations, :users
  end
end
