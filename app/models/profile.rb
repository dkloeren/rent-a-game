class Profile < ApplicationRecord
  belongs_to :user

  has_many :games, through: :user
  has_many :bookings, through: :user
  has_many :reviews, through: :user

  has_one_attached :image

  validates :user, presence: true
  # validates :address,
end
