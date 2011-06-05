class CreateMunicipalities < ActiveRecord::Migration
  def self.up
    create_table :municipalities do |t|
      t.string :name

      t.references :county
    end

    add_index :municipalities, :county_id
  end

  def self.down
    drop_table :municipalities
  end
end
