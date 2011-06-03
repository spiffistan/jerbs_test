class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :salary
      t.date :deadline

      t.references :job_type
      t.references :user
      t.references :company

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
