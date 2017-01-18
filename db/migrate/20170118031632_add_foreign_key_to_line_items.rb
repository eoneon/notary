class AddForeignKeyToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :job, index: true, foreign_key: true
  end
end
