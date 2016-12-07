class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.date :job_date
      t.boolean :job_status, default: 0

      t.timestamps null: false
    end
  end
end
