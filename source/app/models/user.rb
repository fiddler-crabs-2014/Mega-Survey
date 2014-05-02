class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true, length: {minimum: 6}
end
