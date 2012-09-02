class AddGroupIdToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :group_id, :string
  end

  def self.down
    remove_column :bills, :group_id
  end
end
