class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers

  validates :username, uniqueness: true
end
