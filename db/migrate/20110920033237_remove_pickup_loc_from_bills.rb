class RemovePickupLocFromBills < ActiveRecord::Migration
  def up
    remove_column :bills, :pickup_loc
  end

  def down
    add_column :bills, :pickup_loc, :string
  end
end
