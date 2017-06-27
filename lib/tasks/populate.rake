namespace :db do
  desc "Clear the DB and fill with excellent sample data"
  task :populate => :environment do

    # Clear out the old junk
    [Genre, Artist, Song].each(&:destroy_all)

    # Add genres, artists, and songs
    5.times do
      genre = Genre.create(name: Faker::StarWars.specie)

      5..10.times do
        artist = Artist.create(name: Faker::Superhero.name, genre_id: genre.id)

        10..15.times do
          song = Song.create(name: Faker::Company.catch_phrase, artist_id: artist.id)
        end
      end
    end

    puts "Now you gots some good fake data!"
  end
end