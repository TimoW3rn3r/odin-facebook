## User

| field         | type                     | validations           |
| ------------- | ------------------------ | --------------------- |
| email         | string                   | email, unique         |
| first_name    | string                   | presence, length=1-20 |
| last_name     | string                   | presence, length=1-20 |
| profile_photo | active storage reference | -                     |
| address       | string                   | presence, length=1-50 |

```rb
# https://guides.rubyonrails.org/active_storage_overview.html#has-one-attached
has_one_attached :profile_photo
has_many :posts
has_many :comments
has_many :likeables
# Accepted friends
has_many :friendships
has_many :friends, through: :friendships, source: :friend
# Incoming friend request
has_many :incoming_friend_requests, foreign_key: :target_user_id, class_name: "FriendRequest"
has_many :incoming_friends, through: :incoming_friend_requests, source: :initiator
# Outgoing friend request
has_many :outgoing_friend_requests, foreign_key: :initiator, class_name: "FriendRequest"
has_many :outgoing_friends, through: :outgoing_friend_requests, source: :target_user
```


## Post

| field   | type      | validations           |
| ------- | --------- | --------------------- |
| body    | string    | presence, length<1000 |
| user_id | reference | -                     |

```rb
belongs_to :user
has_many :comments, as: :commentable
has_many :likes, as: :likeable
```


## Photo

| field   | type                     | validations |
| ------- | ------------------------ | ----------- |
| image   | active storage reference | -           |
| user_id | reference                | -           |

```rb
belongs_to :user
has_many :comments, as: :commentable
has_many :likes, as: :likeable
```


## Comment

| field       | type                   | validations          |
| ----------- | ---------------------- | -------------------- |
| body        | string                 | presence, length<500 |
| user_id     | reference              | -                    |
| commentable | reference(polymorphic) | -                    |

```rb
belongs_to :commentable, polymorphic: true
belongs_to :user
has_many :likes, as: :likeable
```


## Like

| field    | type                   | validations |
| -------- | ---------------------- | ----------- |
| user_id  | reference              | -           |
| likeable | reference(polymorphic) | -           |

```rb
belongs_to :likeable, polymorphic: true
belongs_to :user
```


## Friendship

| field     | type      | validations |
| --------- | --------- | ----------- |
| user_id   | reference | -           |
| friend_id | reference | -           |


```rb
belongs_to :user
belongs_to :friend, class_name: "User"
```


## FriendRequest

| field          | type      | validations |
| -------------- | --------- | ----------- |
| initiator_id   | reference | -           |
| target_user_id | reference | -           |


```rb
belongs_to :initiator, class_name: "User"
belongs_to :target_user, class_name: "User"
```

