class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :level, presence: true
  validates :favorite_line, presence: true
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end
