# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
booking = {date: '11-10-2020',start_time: '14:00', end_time: '15:00', adjusted_price: 200, experience_id: 1, customer_id: 1 }
b = Booking.create!(booking)
puts `#{b}`
