class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :fed_bank
  
  has_one :group, :dependent => :nullify
  
  scope :current_location, select("curr_loc")
  scope :original_location, select("orig_loc")
  
  validates_uniqueness_of :serial, :scope => [:serial, :user_id]
  
  def has_a_group?
    bill = Bill.find_by_serial(self.serial)
    return false if bill.blank? # first time in database
    return bill.group_id.blank? ? false : true
    false
  end
end
