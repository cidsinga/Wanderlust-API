# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    rand(15..35).times do
      destinations = []
      destinations.push(Destination.create!(
        country: Faker::Address.country,
        city: Faker::Games::Zelda.location,
        specific_location: Faker::Movies::LordOfTheRings.location
        ))
        destinations
        rand(3..15).times do
          destinations.each do |destination|
            Review.create! :author => Faker::Name.name, :content => Faker::Games::WorldOfWarcraft.quote, :rating => rand(1..5),
            :destination_id => destination.id
          end
        end
      end
      puts "Created #{Destination.count} destinations with #{Review.count} reviews."
    end
  end

  Seed.begin
