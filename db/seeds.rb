require "faker"

puts "seeding..."

10.times do
  Shelter.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address
  )
end

30.times do
  Adopter.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

40.times do
  adopted = rand(0..1)
  adopter = nil
  adopter = rand(1..30) if (adopted == 1)
  Pet.create(
    name: Faker::Creature::Dog.name,
    age: rand(1..15),
    species: Faker::Creature::Dog.breed,
    adopted?: adopted,
    shelter_id: rand(1..10),
    adopter_id: adopter
  )
end

puts "done!"
