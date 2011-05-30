class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = Post.popular_posts

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to user_post_path(@post), :notice => "Post has been created."
    else
      render "new", :notice => "Post has not been created."
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id:@post.id)

    respond_to do |format|
      format.html
      format.xml
    end
  end

end

