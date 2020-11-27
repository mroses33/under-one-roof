class RemoveDurationFromExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :duration, :time
  end
end
