class CreateFedBanks < ActiveRecord::Migration
  def up
    create_table :fedbanks do |t|
      t.string :bank_id, :primary_key
      t.string :name, :default => ""
      t.integer :num_bills_actual, :default => 0
      t.integer :num_bills_claimed, :default => 0
      t.timestamps
    end
  end
  
  def down
    drop_table :fedbanks
  end
end
