class RenameBilleeToBillable < ActiveRecord::Migration
  def change
    rename_column :jobs, :billee_id, :billable_id
  end
end
