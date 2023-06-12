class Friendship < ApplicationRecord

  # initiator_id:  reference
  # target_id:     reference
  # accepted:      boolean

  belongs_to :initiator, class_name: "User"
  belongs_to :target, class_name: "User"
end
