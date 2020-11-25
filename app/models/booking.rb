class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :customer, :class_name => "User"
  has_many :reviews, dependent: :destroy

end
