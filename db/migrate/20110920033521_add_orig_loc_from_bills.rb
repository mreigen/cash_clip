class AddOrigLocFromBills < ActiveRecord::Migration
  def change
    add_column :bills, :orig_loc, :string
  end
end
