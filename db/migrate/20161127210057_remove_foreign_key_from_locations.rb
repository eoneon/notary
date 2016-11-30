class RemoveForeignKeyFromLocations < ActiveRecord::Migration
  def change
    # remove_reference :locations, :user, index: true
    remove_foreign_key :locations, :users
  end
end
