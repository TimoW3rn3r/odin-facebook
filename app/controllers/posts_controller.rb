class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :comments).desc
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @user = @post.user
    # @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
