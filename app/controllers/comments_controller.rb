class CommentsController < ApplicationController
  before_action :set_commentable, only: [:create]

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
    params.require(:comment).permit(:body)
  end

  def set_commentable
    if params[:post_id]
      @commentable = Post.find(params[:post_id])
    end
  end
end
