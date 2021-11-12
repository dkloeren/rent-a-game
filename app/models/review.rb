class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true, inclusion: { in: 0..5, message: ":  rating = %<value>s -> !! Value Out of range (0..5) !!" }
end
