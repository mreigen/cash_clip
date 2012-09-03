class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  
  acts_as_followable
  
  def owner
    self.user
  end
  
  def liked_by_user?(user = nil)
    return false if user.blank?
    self.followed_by?(user)
  end
end