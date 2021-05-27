require 'open-uri'
require 'json'

puts 'Destroying all...'
Movie.destroy_all
puts 'destroyed!'

puts 'Accessing API...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)

puts movies['results'].sample
puts 'API accessed!'

puts 'Running seed...'
4.times do

  movie = Movie.create!(
    title: movies['results'].sample['original_title'],
    overview:  movies['results'].sample['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movies['results'].sample['poster_path']}"
  )

  puts movie['poster_url']
end

puts "DB populated with #{Movie.count} movies"

