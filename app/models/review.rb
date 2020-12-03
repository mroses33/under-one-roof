class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, :comment, presence: true
end
