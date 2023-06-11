class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(
      initiator_id: current_user.id,
      target_id: params[:friendship][:user_id]
    )

    if @friendship.save
      flash[:notice] = "Friend Request sent."
    end
    redirect_back_or_to root_path
  end

  def accept
    @friendship = Friendship.find(params[:id])

    if @friendship.update(accepted: true)
      flash[:notice] = "Friend Request accepted."
    end
    redirect_back_or_to root_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    if @friendship.destroy
      flash[:notice] = "Friend Request declined."
    end
    redirect_back_or_to root_path
  end
end
