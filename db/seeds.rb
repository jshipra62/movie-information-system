# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Admin", email: "admin@kreeti.com", password: "admin123", password_confirmation: "admin123", admin: true)
User.create(name: "Shipra", email: "shipra@kreeti.com", password: "123456", password_confirmation: "12345")

Theater.create(name: "PVR", seats: 150, price: 240)
Theater.create(name: "Carnival Cinemas", seats: 90, price: 180)
Theater.create(name: "RDB", seats: 120, price: 120)

Language.create(language: "English")
Language.create(language: "Hindi")
Language.create(language: "Bengali")
