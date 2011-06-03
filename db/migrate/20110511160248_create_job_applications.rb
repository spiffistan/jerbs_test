class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.date :date
      t.string :filename

      t.references :user
      t.references :job

      t.timestamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end
