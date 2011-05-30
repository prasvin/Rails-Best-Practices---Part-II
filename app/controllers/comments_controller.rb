class CommentsController < ApplicationController
  before_filter :login_required

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @post.comments = @comment

    if @comment.is_minimum_length? && @comment.save
      redirect_to user_post_path(@post), :notice => "Comment has been created."
    else
      render 'new', :notice => "Comment has not been created."
    end
  end

end

