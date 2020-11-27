class Review < ApplicationRecord
  belongs_to :booking


  validates :rating, numericality: { greater_than: 0, less_than: 6 }
  validates :rating, :comment, presence: true
end
