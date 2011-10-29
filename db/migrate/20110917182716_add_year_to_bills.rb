class AddYearToBills < ActiveRecord::Migration
  def change
    add_column :bills, :year, :integer, :null=>false, :default=>-1
  end
end
