class CreateBillPoints < ActiveRecord::Migration
  def self.up
     create_table :bill_points do |t|
       t.primary_key :id
       t.integer :owner_count
       t.integer :distance
       t.integer :repeater
       t.float :average_speed
       t.float :trust_points

       t.timestamps
     end
   end
   def self.down
     drop_table :bill_points
   end
 end