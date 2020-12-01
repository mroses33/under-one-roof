class GuestBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :user
end
