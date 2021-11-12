class Console < ApplicationRecord
  has_many :Games

  validates :name, presence: true
  validates :short, presence: true
  has_one_attached :image
end
