class User < ApplicationRecord

  # email         :string
  # first_name    :string
  # last_name     :string
  # address       :string

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # https://stackoverflow.com/questions/38611405/email-validation-in-ruby-on-rails
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, format: { with: Devise.email_regexp }
end
