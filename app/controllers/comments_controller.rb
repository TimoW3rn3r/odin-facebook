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

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

  def set_commentable
    if commentable_id = params[:post_id]
      @commentable = Post.find(commentable_id)
      @commentabe_type = 'Post'
    end
  end
end
