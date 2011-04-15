class CreateGigs < ActiveRecord::Migration
  def self.up
    create_table :gigs do |t|
      t.string :name
      t.text :address
      t.timestamp :gigdate
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :gigs
  end
end
