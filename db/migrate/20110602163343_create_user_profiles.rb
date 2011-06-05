class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :address
      t.string :place
      t.string :post_code
      t.string :municipality
      t.string :county
      t.string :country

      # t.column :facebook_id, 'bigint'

      t.references :company

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
