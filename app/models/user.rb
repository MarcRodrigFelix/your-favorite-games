class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }, unless: ->(user){ user.password.blank? }
  has_many :games
end