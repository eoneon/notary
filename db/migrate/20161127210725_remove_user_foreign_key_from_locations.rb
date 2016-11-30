class RemoveUserForeignKeyFromLocations < ActiveRecord::Migration
  def change
    remove_foreign_key :locations, :users
    remove_reference :locations, :user, index: true
  end
end
