# Patrick Kennedy Mike Foster
# Movie-Catalog Challenge
# 11/19/14

require 'pry'
require 'sinatra'
require 'csv'

movie_catalog = File.read('movies.csv')
movie_catalog = CSV.parse(movie_catalog)

#movie_keys = movie_catalog[0][0..5]

movie_arr = []

movie_catalog.each do |id, title, year, synopsis, rating, genre, studio|
	movie_arr << { id: id, title: title, year: year, synopsis: synopsis, 
		rating: rating, genre: genre, studio: studio }
end

movie_arr.shift

get '/' do
	@movies = movie_arr
	erb :index
end

get '/movies/*' do |link|
	movie_arr.each do |movie|
		if movie[:id] == link
			@movie_link = movie
	 	end
	end
	erb :movies
end
