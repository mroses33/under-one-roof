class Instance < ApplicationRecord
  belongs_to :experience
  validates :start_time, uniqueness: {message: "You already have a booking at this time!"}
end
