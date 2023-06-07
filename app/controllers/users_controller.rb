class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    @user = current_user
    @posts = @user.posts.includes(comments: [:user]).desc
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(comments: [:user]).desc
  end
end
