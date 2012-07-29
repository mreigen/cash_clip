class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :fed_bank
  
  scope :current_location, select("curr_loc")
  scope :original_location, select("orig_loc")
end
