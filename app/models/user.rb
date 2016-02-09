class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :likes
  has_many :posts_liked, through: :likes, source: :posts

  validates :first_name, :last_name, :alias,  presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
end
