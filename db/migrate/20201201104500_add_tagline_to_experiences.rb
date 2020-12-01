class AddTaglineToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :tagline, :string
  end
end
