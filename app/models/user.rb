class User < ActiveRecord::Base
  has_secure_password
  validate :username, uniqueness: true
  has_many :games
end