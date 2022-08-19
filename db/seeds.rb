# Seed the database with test data – only for development
return if Rails.env.production?

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

puts 'Done!'
