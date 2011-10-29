class AddBacknumberToBills < ActiveRecord::Migration
  def change
    add_column :bills, :backnumber, :integer, :null=>false, :default=>-1
  end
end
