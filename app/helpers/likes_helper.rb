module LikesHelper
  def self.find_like(likeable, user)
    likeable.likes.each do |like|
      return like if like.user == user
    end

    nil
  end

  def new_like_path(likeable)
    if likeable.respond_to?(:commentable)
      [likeable.commentable, likeable, Like.new]
    else
      [likeable, Like.new]
    end
  end
end
