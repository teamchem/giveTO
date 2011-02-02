class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.integer :organization
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :volunteers_needed

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
