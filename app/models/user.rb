class User < ApplicationRecord

  # email         :string
  # first_name    :string
  # last_name     :string
  # address       :string
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :profile_picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [64, 64]
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # https://stackoverflow.com/questions/38611405/email-validation-in-ruby-on-rails
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, format: { with: Devise.email_regexp }

  def full_name
    "#{first_name} #{last_name}"
  end

  def friendships
    Friendship.where("initiator_id = ? OR target_id = ?", id, id)
  end

  def friends
    accepted_friendships = friendships.includes(:initiator, :target).where("accepted = ?", true)
    accepted_friendships.map do |friendship|
      friendship.initiator == self ? friendship.target : friendship.initiator
    end
  end
end
