require 'open-uri'

puts 'Destroying everything...'
List.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Movie.destroy_all if Rails.env.development?
puts "Users.count #{User.count}" 
puts "Lists.count #{List.count}" 
puts "Movies.count #{Movie.count}" 
puts "Reviews.count #{Review.count}" 
puts 'Everythig was destroyed!'

puts 'Accessing API...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)

puts movies['results'].sample
puts 'API accessed!'

puts 'Running seed...'
movies['results'].each do |movie_hash| 
  movie = Movie.create!(
    title: movie_hash['original_title'],
    overview:  movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash['backdrop_path']}",
    big_poster: "https://image.tmdb.org/t/p/w500#{movie_hash['poster_path']}",
    rating: movie_hash['vote_average'],
    # production_companies: movie_hash['production_companies'].map { |company| company[:id] }.min,
    original_language: movie_hash['original_language'],
    release_date: movie_hash['release_date'],
    tmdb_id: movie_hash['id']
  )

  puts movie['poster_url']
end

user = User.new(
  first_name: "Pedro",
  last_name: "Cherques",
  email: "pedro@teste.com",
  password: 123456,
)
file = URI.open('http://res.cloudinary.com/seguraocode/image/upload/v1622698711/ws42osrevz2dulqlbkt7.jpg')
user.profile_photo.attach(io: file, filename: "#{user.last_name}.png", content_type: 'image/png')

user.save!

user_2 = User.new(
  first_name: "Belisa",
  last_name: "Betega",
  email: "belisa@teste.com",
  password: 123456,
  profile_photo: "http://res.cloudinary.com/seguraocode/image/upload/v1622698718/t5roue1vctrmcabpvihj.jpg"
)

file = URI.open('http://res.cloudinary.com/seguraocode/image/upload/v1622698718/t5roue1vctrmcabpvihj.jpg')
user_2.profile_photo.attach(io: file, filename: "#{user_2.last_name}.png", content_type: 'image/png')

user_2.save!

puts "DB populated with #{Movie.count} movies and #{User.count} users"
puts "zo/"

