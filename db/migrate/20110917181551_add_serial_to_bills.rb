class AddSerialToBills < ActiveRecord::Migration
  def change
    add_column :bills, :serial, :string, :null => false, :limit => 10, :default => "XX00000000X"
  end
end
