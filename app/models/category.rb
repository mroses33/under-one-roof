class Category < ApplicationRecord
  has_many :experience_categories, dependent: :destroy
end
