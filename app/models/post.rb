class Post < ApplicationRecord

  # body:     string
  # user:     reference

  scope :desc, -> { order('id desc') }

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 1000 }
end
