class AddDetailsToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :user, index: true
  end
end