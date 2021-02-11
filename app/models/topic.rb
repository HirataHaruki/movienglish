class Topic < ApplicationRecord
  LEVEL_VALIDATION = ['英検1級レベル・TOEIC850点レベル', '英検準1級レベル・TOEIC700点レベル', '英検2級レベル・TOEIC550点レベル', 'その他']
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :level, presence: true, inclusion: { in: LEVEL_VALIDATION }
  validates :favorite_line, presence: true
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :unfavorites
  has_many :unfavorite_users, through: :unfavorites, source: 'user'
  has_many :comments
end
