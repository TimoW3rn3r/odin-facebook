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
has_many :friendships
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

| field        | type      | validations |
| ------------ | --------- | ----------- |
| initiator_id | reference | -           |
| target_id    | reference | -           |

