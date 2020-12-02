class Favorite < ApplicationRecord
  belongs_to :experience
  belongs_to :customer, class_name: "User"
end
