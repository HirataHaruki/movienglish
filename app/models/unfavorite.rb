class Unfavorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic
end
