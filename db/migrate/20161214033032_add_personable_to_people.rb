class AddPersonableToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :personable, polymorphic: true, index: true
  end
end
