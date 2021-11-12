class Genre < ApplicationRecord
  has_many :Games
  has_one_attached :image

  validates :name, presence: true
end
