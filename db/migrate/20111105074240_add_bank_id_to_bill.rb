class AddBankIdToBill < ActiveRecord::Migration
  def change
    add_column :bills, :bank_id, :string, :default => "Z"
  end
end
