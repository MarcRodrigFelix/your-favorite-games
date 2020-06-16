class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }
  has_many :games
end