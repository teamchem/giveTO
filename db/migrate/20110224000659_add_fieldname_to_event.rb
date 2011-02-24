class AddFieldnameToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :rso_type, :string
  end

  def self.down
    remove_column :events, :rso_type
  end
end
