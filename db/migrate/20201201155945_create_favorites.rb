class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :experience, null: false, foreign_key: true
      t.references :customer, null: false

      t.timestamps
    end
    add_foreign_key :favorites, :users, column: :customer_id, primary_key: :id
  end
end
