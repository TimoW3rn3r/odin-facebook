module CommentsHelper
  def turbo_frame_id(comment)
    "#{comment.commentable.class.to_s.downcase}_#{comment.commentable.id}"
  end
end
