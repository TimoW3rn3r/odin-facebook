module LikesHelper
  def find_like(likeable, user)
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

  def commentable_comment_likes_path(comment)
    commentable_type = comment.commentable.class.to_s.downcase
    self.send("#{commentable_type}_comment_likes_path", comment.commentable, comment)
  end
end
