class AddIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :id, :primary_key
  end
end
