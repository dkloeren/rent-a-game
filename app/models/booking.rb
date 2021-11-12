class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_many :reviews, dependent: :nullify

  validates :start_date, presence: true
  validates :end_date, presence: true
  # custom validations
  validate :start_date, :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  # check dates
  scope :active, -> { where("start_date <= ? AND end_date >= ?", Date.today, Date.today) }
  scope :reserved, -> { where("start_date > ?", Date.today) }
  scope :ended, -> { where("end_date < ?", Date.today) }

  def start_date_cannot_be_in_the_past
    return nil unless start_date.present? && start_date < Date.today

    errors.add(:start_date, "can't be in the past")
  end

  def end_date_cannot_be_before_start_date
    return nil unless end_date.present? && end_date < start_date

    errors.add(:end_date, "can't be before starting date")
  end
end
