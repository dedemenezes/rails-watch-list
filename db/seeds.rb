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
    rating: movie_hash['vote_average']
  )

  puts movie['poster_url']
end
User.create!(
  first_name: "Pedro",
  last_name: "Cherques",
  email: "teste@teste.com",
  password: 123456,
)
User.create!(
  first_name: "Belisa",
  last_name: "Betega",
  email: "teste@teste.com",
  password: 123456,
)

puts "DB populated with #{Movie.count} movies"
puts "zo/"

