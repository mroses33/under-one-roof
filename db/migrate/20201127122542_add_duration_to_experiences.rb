class AddDurationToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :duration, :integer
  end
end
