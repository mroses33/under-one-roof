class Booking < ApplicationRecord
  # after_create :generate_code
  belongs_to :experience
  belongs_to :customer, :class_name => "User"
  has_many :reviews, dependent: :destroy

  # def generate_code
  #   self.code = SecureRandom.hex
  #   save
  # end
end
