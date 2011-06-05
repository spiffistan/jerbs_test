class CreatePostCodes < ActiveRecord::Migration
  def self.up
    create_table :post_codes, { :id => false } do |t|
      t.column :post_code, 'smallint(4) unsigned zerofill'
      t.string :place

      t.references :municipality
    end

    execute 'ALTER TABLE post_codes ADD PRIMARY KEY (post_code)'
    add_index :post_codes, :municipality_id, :unique => false
  end

  def self.down
    drop_table :post_codes
  end
end
