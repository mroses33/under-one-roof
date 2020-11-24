class AddExperienceIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :experience_id, :bigint
  end
end
