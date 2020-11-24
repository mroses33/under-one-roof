class Experience < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true
  validates :price, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :kid_friendly, presence: true
  validates :duration, presence: true
  validates :max_guests, presence: true
  validates :language, presence: true
end
