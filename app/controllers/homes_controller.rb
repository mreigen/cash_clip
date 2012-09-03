class HomesController < ApplicationController
  before_filter :login_required
  
  def show
    @posts = []
    @posts << current_user.posts
    @posts.flatten!
  end
  
end
