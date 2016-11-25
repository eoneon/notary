class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :commission_number, :integer
    add_column :users, :commission_expiration, :date
  end
end
