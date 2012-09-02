class CreatePostTable < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string  :user_id
      t.string  :group_id
      t.text    :message
      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
