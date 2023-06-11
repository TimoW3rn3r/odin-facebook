module FriendshipsHelper
  def friendship_status(user_id)
    if current_user.id == user_id
      return nil, 'self'
    end

    current_user.friendships.each do |friendship|
      if friendship.initiator_id == user_id
        if friendship.accepted
          return friendship, 'accepted'
        else
          return friendship, 'incoming'
        end
      elsif friendship.target_id == user_id
        if friendship.accepted
          return friendship, 'accepted'
        else
          return friendship, 'outgoing'
        end
      end
    end

    return nil, 'not friend'
  end
end
