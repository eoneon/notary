class RemoveCompanyIdFromJobs < ActiveRecord::Migration
  def change
    remove_foreign_key :jobs, :company
  end
end
