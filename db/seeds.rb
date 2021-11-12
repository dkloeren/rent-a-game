# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Clean DB
Genre.destroy_all
Console.destroy_all
Game.destroy_all
User.destroy_all
Profile.destroy_all
Booking.destroy_all
Review.destroy_all
puts 'clean databasee'

# Seeds
Genre.create!(name: "Action-Adventure") #1
Genre.create!(name: "Beat 'em Up") #2
Genre.create!(name: "RPG") #3
Genre.create!(name: "First-Person Shooter") #4
Genre.create!(name: "Simulation") #5
Genre.create!(name: "Party")
Genre.create!(name: "Puzzle")
Genre.create!(name: "Shoot 'em Up")
Genre.create!(name: "Platformer")
Genre.create!(name: "Metroidvania") #10
Genre.create!(name: "Real-Time Strategy")
Genre.create!(name: "Turn-Based Strategy")
Genre.create!(name: "Adventure")
Genre.create!(name: "Visual Novel")
Genre.create!(name: "Indi") #15
Genre.create!(name: "Rogue-Like")
Genre.create!(name: "Rogue-Light")
Genre.create!(name: "Card Game")
Genre.create!(name: "MMORPG")
Genre.create!(name: "Battle Royale") #20
Genre.create!(name: "Multiplayer")
Genre.create!(name: "Sport")
Genre.create!(name: "PVE")
Genre.create!(name: "Horror")
Genre.create!(name: "Action") #25
Genre.create!(name: "Health")
Genre.create!(name: "Excercise")
Genre.create!(name: "Music")
puts 'Genres created'

Console.create!(name: "Nintendo Switch", short: "NSW")
Console.create!(name: "Sony Playstation 4", short: "PS4")
Console.create!(name: "Sony Playstation 5", short: "PS5")
Console.create!(name: "Steam", short: "Steam")
puts "#{Console.count} Consoles created"

User.create!(username: "Daddy", email: "daddy@email.com", password: "123456")
User.create!(username: "Mommy", email: "mommy@email.com", password: "123456")
User.create!(username: "Player 1", email: "player@email.com", password: "123456")
puts "#{User.count} Users created"

Profile.create!(user: User.find(1), first_name: "Dad", last_name:"Jokes", address: "Tempelhofer Damm 6, 12101 Berlin")
Profile.create!(user: User.find(2), first_name: "Mom", last_name:"Jeans", address: "24 45th Str., New York")
Profile.create!(user: User.find(3), first_name: "Player", last_name:"Essence", address: "Turmstrasse 14, 10559 Berlin")
puts "#{Profile.count} Profiles created"

Game.create!(title: "Zelda Breath of the Wild", price_per_day: 5.50, genre: Genre.find(1), console: Console.find(1), user: User.find(3), description: "Best Open world game of all time.")
Game.create!(title: "Monster Hunter Rise", price_per_day: 4.50, genre: Genre.find(25), console: Console.find(1), user: User.find(1), description: "Endless fun beating Monsters with 18 different weapons.")
Game.create!(title: "Nier Automata", price_per_day: 6.66, genre: Genre.find(1), console: Console.find(2), user: User.find(2), description: "Innovative, bold and sexy content.")
Game.create!(title: "Persona 5", price_per_day: 5.50, genre: Genre.find(3), console: Console.find(2), user: User.find(3), description: "Role playing game with great social mechanics and amazing score.")
puts "#{Game.count} Games created"

Booking.create!(user:User.find(3), game:Game.find(2), start_date:"2021-10-10", end_date:"2021-10-30", status:2) # status confirmed
Booking.create!(user:User.find(1), game:Game.find(4), start_date:"2021-11-13", end_date:"2021-11-15", status:0) # status not confirmed
Booking.create!(user:User.find(2), game:Game.find(1), start_date:Date.today, end_date:Date.tomorrow, status:1) # status not confirmed
puts "#{Booking.count} Bookings created"

Review.create!(booking:Booking.find(1), rating: 4, comments: "Great game but dungeons were not interesting enough!")
puts "#{Review.count} Reviews created"
