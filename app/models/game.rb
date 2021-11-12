class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :console
  belongs_to :user

  has_many :bookings, dependent: :nullify
  has_many :reviews, through: :bookings

  has_one_attached :image

  validates :title, presence: true
  validates :price_per_day, presence: true
end
