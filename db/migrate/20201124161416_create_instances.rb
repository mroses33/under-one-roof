class CreateInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :instances do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
