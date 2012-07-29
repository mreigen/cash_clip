class Fedbank < ActiveRecord::Base
  has_many :users, :through => :fedbank_users
  has_many :fedbank_users
  has_many :bills
  
  scope :by_bank_id, lambda {|bi| where(['bank_id like ?', bi])} 
end
