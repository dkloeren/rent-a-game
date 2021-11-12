class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :nullify
  has_many :games
  has_many :bookings, dependent: :nullify
  has_many :bookings_as_owner, through: :games, source: :bookings, dependent: :nullify
  has_many :reviews, through: :bookings
end
