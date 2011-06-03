class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :address
      t.string :place
      t.string :subdivision_1
      t.string :subdivision_2
      t.string :country
      t.string :postal_code

      t.column :facebook_id, 'bigint'

      t.references :company

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
