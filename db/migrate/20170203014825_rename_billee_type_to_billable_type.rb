class RenameBilleeTypeToBillableType < ActiveRecord::Migration
  def change
    rename_column :jobs, :billee_type, :billable_type
  end
end
