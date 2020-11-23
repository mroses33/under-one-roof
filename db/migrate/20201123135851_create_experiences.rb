class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :host, null: false
      t.string :country
      t.float :latitude
      t.float :longitude
      t.boolean :kid_friendly
      t.string :address
      t.time :duration
      t.integer :max_guests
      t.string :language

      t.timestamps
    end
    add_foreign_key :experiences, :users, column: :host_id, primary_key: :id
  end
end
