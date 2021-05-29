require 'open-uri'

puts 'Destroying all...'
Movie.destroy_all if Rails.env.development?
puts 'destroyed!'

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

puts "DB populated with #{Movie.count} movies"
puts "zo/"

