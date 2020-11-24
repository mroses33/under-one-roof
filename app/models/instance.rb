class Instance < ApplicationRecord
  belongs_to :experience
  validates :start_time, uniqueness: {scope: :host_id, message: "You already have a booking at this time!"}
end
