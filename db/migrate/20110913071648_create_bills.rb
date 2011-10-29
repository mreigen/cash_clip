class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :billid, :primary_key
      t.string :pickup_loc
      t.double :points
      t.timestamps
    end
  end
end
