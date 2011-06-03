class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :short_description
      t.string :address
      t.string :place
      t.string :subdivision_1
      t.string :subdivision_2
      t.string :country
      t.string :postal_code
      t.string :web_address
      t.integer :org_number
      t.boolean :recruiter

      t.references :industry

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
