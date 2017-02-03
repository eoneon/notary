class RemoveCompanyForeignKeyFromJobs < ActiveRecord::Migration
  def change
    remove_reference :jobs, :company, index: true
  end
end
