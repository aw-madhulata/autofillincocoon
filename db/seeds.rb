# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
50.times do 
  Container.create(number:  Faker::Alphanumeric.alpha(number: 10), size: "#{Faker::Number.number(digits: 2)}X#{Faker::Number.number(digits: 2)}", price: Faker::Commerce.price,  gate: ["Ingate", "Outgate"].sample )
end 
