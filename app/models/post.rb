class Post < ApplicationRecord

  # body:     string
  # user:     reference

  validates :body, presence: true, length: { maximum: 1000 }
end
