class PostsController < ApplicationController
  def index
    # show friends posts and current_user posts
    users = current_user.friends
    users << current_user

    @posts = Post.includes(:user, comments: [:user, likes: [:user]], likes: [:user])
      .where(user: users)
      .desc
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_back_or_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.includes(:user, comments: [:user, likes: [:user]], likes: [:user]).find(params[:id])
    @user = @post.user
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
