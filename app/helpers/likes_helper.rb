module LikesHelper
  def self.find_like(likeable, user)
    likeable.likes.each do |like|
      return like if like.user == user
    end

    nil
  end
end
