class CreateUsersFedBanksJoinTable < ActiveRecord::Migration
  def up
    create_table :fedbank_users, :id => false do |t|
      t.string :fedbank_id
      t.integer :user_id
    end
  end

  def down
    drop_table :fedbank_users
  end
end
