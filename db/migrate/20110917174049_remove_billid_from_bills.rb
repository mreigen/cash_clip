class RemoveBillidFromBills < ActiveRecord::Migration
  def up
    remove_column :bills, :billid
  end

  def down
    add_column :bills, :billid, :string
  end
end
