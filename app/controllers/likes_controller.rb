class LikesController < ApplicationController
  before_action :set_likeable, only: [:create, :destroy]

  def create
    @like = current_user.likes.build(
      likeable: @likeable
    )

    if @like.save
      flash[:notice] = "Liked successfully."
      redirect_to @likeable
    else
      redirect_to @likeable
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = "Disliked successfully."
    redirect_to @likeable
  end

  private

  def set_likeable
    if params[:post_id]
      @likeable = Post.find(params[:post_id])
    end
  end
end
