class AddForeignKeyToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :experiences
  end
end

