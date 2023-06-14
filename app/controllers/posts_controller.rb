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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post updated successfully."
    end

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user  == current_user
      @post.destroy
      flash[:notice] = "Post deleted successfully."
      redirect_back_or_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
