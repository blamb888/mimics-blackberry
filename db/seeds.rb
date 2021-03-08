# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts("CLEANING DB")
Event.destroy_all
Calendar.destroy_all
User.destroy_all

puts("SEED INITIATING")
dm = User.new({email: "dm@gmail.com", password: "secret"})
dm.save
player1 = User.new({email: "player1@gmail.com", password: "secret"})
player1.save
player2 = User.new({email: "player2@gmail.com", password: "secret"})
player2.save
player3 = User.new({email: "player3@gmail.com", password: "secret"})
player3.save
player4 = User.new({email: "player4@gmail.com", password: "secret"})
player4.save
puts("USER CREATED")

# calendar = Calendar.new({
#   start_day: 1,
#   start_year: 1,
#   current_day: 1,
#   months: {january:31},
#   weekdays:{monday:0, tuesday: 1, wednesday: 2, thursday: 3, friday: 4, saturday: 5, sunday: 6}
# })
# calendar = Calendar.new({
#   name: "Eberron",
#   start_day: 1,
#   start_year: 1,
#   current_day: 1,
#   months: {Zarantyr: 28, Olarune: 28, Therendor: 28, Eyre: 28, Dravago: 28, Nymm: 28, Lharvion: 28, Barrakas: 28, Rhaan: 28, Sypheros: 28, Aryth: 28, Vult: 28 },
#   weekdays:{Sul: 0, Mol: 1, Zol: 2, Wir: 3, Zor: 4, Far: 5, Sar: 6}
# })
# calendar.user = dm
# calendar.save

# pancake = Event.new(
#   name: "pancake day",
#   category: "holiday",
#   day_number: 10
# )
# pancake.calendar = calendar
# pancake.user = dm
# pancake.save

# rebirth = Event.new({
#   name: "rebirth eve",
#   category: "holiday",
#   day_number: 69
# })
# rebirth.calendar = calendar
# rebirth.user = dm
# rebirth.save
puts("SEED COMPLETE")
