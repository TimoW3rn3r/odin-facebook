class CommentsController < ApplicationController
  before_action :set_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(
      body: comment_params[:body],
      commentable: @commentable
    )

    if @comment.save
      flash.notice = "Comment created successfully."
      redirect_to @commentable
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.body = params[:comment][:body]
      if @comment.save
        flash[:notice] = "Comment updated successfully."
      end
    end

    redirect_to @commentable
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = "Comment deleted successfully."
    end
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_commentable
    if params[:post_id]
      @commentable = Post.find(params[:post_id])
    end
  end
end
