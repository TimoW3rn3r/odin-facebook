class LikesController < ApplicationController
  before_action :set_likeable, only: [:create, :destroy]

  def index
    set_likeable_with_eager_load_likes
  end

  def create
    @like = @likeable.likes.build(
      user: current_user
    )

    if @like.save
      flash[:notice] = "Liked successfully."
      redirect_to redirectable_path(@likeable)
    else
      redirect_to redirectable_path(@likeable)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = "Disliked successfully."
    redirect_to redirectable_path(@likeable)
  end

  private

  def set_likeable
    if params[:comment_id]
      @likeable = Comment.find(params[:comment_id])
    elsif params[:post_id]
      @likeable = Post.find(params[:post_id])
    end
  end

  def set_likeable_with_eager_load_likes
    if params[:comment_id]
      @likeable = Comment.includes(likes: [:user]).find(params[:comment_id])
    elsif params[:post_id]
      @likeable = Post.includes(likes: [:user]).find(params[:post_id])
    end
  end

  def redirectable_path(likeable)
    if likeable.respond_to? :commentable
      likeable.commentable
    else
      likeable
    end
  end
end
