class AddBilleeToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :billee, polymorphic: true, index: true
  end
end
