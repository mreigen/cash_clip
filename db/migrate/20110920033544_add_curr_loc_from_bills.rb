class AddCurrLocFromBills < ActiveRecord::Migration
  def change
    add_column :bills, :curr_loc, :string
  end
end
