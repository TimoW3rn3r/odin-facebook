class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).desc
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(body: post_params[:body],
                    user: current_user)

    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
