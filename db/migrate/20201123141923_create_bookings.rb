class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :adjusted_price
      t.references :experience, null: false, foreign_key: true
      t.references :customer, null: false

      t.timestamps
    end
  add_foreign_key :bookings, :users, column: :customer_id, primary_key: :id
  end
end
