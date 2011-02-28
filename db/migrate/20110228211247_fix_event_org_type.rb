class FixEventOrgType < ActiveRecord::Migration
  def self.up
    change_column :events, :organization, :string 
  end

  def self.down
  end
end
