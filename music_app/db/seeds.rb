# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(email: "user1@musicapp.com", password: "ilikepop")
user2 = User.create(email: "user2@musicapp.com", password: "iikerock")

Band.destroy_all
b1 = Band.create(name: "The Police")
b2 = Band.create(name: "Aerosmith")
b3 = Band.create(name: "The Beatles")
