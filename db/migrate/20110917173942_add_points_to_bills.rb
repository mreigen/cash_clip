class AddPointsToBills < ActiveRecord::Migration
  def change
    add_column :bills, :points, :double
  end
end
