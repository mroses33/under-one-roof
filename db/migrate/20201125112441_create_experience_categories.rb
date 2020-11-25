class CreateExperienceCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :experience_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
