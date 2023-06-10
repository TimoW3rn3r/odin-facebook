class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    @user = current_user
    @posts = @user.posts.includes(comments: [:user, likes: [:user]], likes: [:user]).desc
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(comments: [:user, likes: [:user]], likes: [:user]).desc
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update!(user_params)
      flash[:notice] = "Profile updated successfully."
      redirect_to current_user
    else
      flash[:notice] = @user.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :profile_picture)
  end
end
