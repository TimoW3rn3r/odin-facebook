class Like < ApplicationRecord

  # user:    reference

  belongs_to :user
  belongs_to :likeable, polymorphic: true
end
