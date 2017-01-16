class AddDetailsToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :type, :string
    add_column :line_items, :quantity, :integer
    change_column :line_items, :fee, :integer
    add_reference :line_items, :itemizable, polymorphic: true, index: true
  end
end
