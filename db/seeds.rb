# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("SEED INITIATING")

u = User.new({email: "andy@gmail.com", password: "secret"})
u.save

puts("USER CREATED")

calendar = Calendar.new({
  start_day: 1,
  start_year: 1,
  current_day: 1,
  months: {january:31},
  weekdays:{monday:0, tuesday: 1, wednesday: 2, thursday: 3, friday: 4, saturday: 5, sunday: 6}
})
calendar.user = u
calendar.save

puts("SEED COMPLETE")