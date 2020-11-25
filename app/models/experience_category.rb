class ExperienceCategory < ApplicationRecord
  belongs_to :category
  belongs_to :experience
end
