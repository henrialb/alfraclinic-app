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

puts '---------------'

# Challenges
puts 'Destroying challenges and associated records'
Challenge.destroy_all

puts 'Creating challenges'

challenges = {
  'light beams' => 0,
  'cycling' => 1,
  'treadmill running' => 2,
  'flexibiliy' => 3
}

challenges.each do |challenge|
  Challenge.create!(
    name: challenge[0],
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
      do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    result_unit: challenge[1],
    category: rand(0..2)
  )
end

puts '---------------'
puts 'Done!'
