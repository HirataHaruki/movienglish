class User < ApplicationRecord
  EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_VALIDATION }
  validates :password, presence: true, length: { minimum: 8 }
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :unfavorites
  has_many :comments
end
