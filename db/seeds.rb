# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding 🌱'
puts '---------------'

# Athletes
puts 'Destroying athletes and associated records'
Athlete.destroy_all

puts 'Creating athletes'

10.times do
  Athlete.create!(
    name: Faker::Name.name,
    date_of_birth: Faker::Date.birthday(min_age: 15, max_age: 75),
    level: rand(0..1)
  )
end
