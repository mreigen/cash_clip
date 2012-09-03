class HomesController < ApplicationController
  before_filter :login_required
  
  def show
    @posts = current_user.posts
    @posts.reverse!
  end
  
end
