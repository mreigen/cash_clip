class FedbankUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :fedbank
end
