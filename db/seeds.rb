class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    rand(15..35).times do
      destinations = []
      destinations.push(Destination.create!(
        country: "United States of America",
        city: "Springfield",
        specific_location: Faker::TvShows::Simpsons.location
        ))
        destinations
        rand(3..15).times do
          destinations.each do |destination|
            Review.create! :author => Faker::TvShows::Simpsons.character, :content => Faker::TvShows::Simpsons.quote, :rating => rand(1..5),
            :destination_id => destination.id
          end
        end
      end
      puts "Created #{Destination.count} destinations with #{Review.count} reviews."
    end
  end

  Seed.begin
