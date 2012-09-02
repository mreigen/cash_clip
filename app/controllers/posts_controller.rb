class PostsController < ApplicationController
  def new
    @post = Post.new
    @group = current_user.all_following.first
  end
  
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(:action => "index", :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end
  
  def index
    @posts = []
    # might need to be changed because users may not only follow group but other users
    current_user.all_following.each do |group|
      @posts << group.posts
    end
    @posts.flatten!
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end