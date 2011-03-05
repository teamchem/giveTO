class CreateVolunteers < ActiveRecord::Migration
  def self.up
    create_table :volunteers do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :volunteers, :user_id
    add_index :volunteers, :event_id
    add_index :volunteers, [:user_id, :event_id], :unique => true
  end

  def self.down
    drop_table :volunteers
  end
end
