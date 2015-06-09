require "sinatra"
require "sinatra/reloader"
require "./lib/scrabble"

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
  	@title = "Home"
	   erb :home
  end

  get '/score' do
    @title = "Score"
    erb :score
  end

  post '/score' do
  	# call on scrabble.rb file here
    @word = params[:word]
    @score = Scrabble.score(@word)
    @title = "Score"
    erb :score
  end

  get '/score_multiple' do
    @title = "Score multiple words"
    erb :score_multiple
  end

  # post '/score' do
  #   # call on scrabble.rb file here
  #   @word = params[:word]
  #   @score = Scrabble.score(@word)
  #   @title = "Score"
  #   erb :score
  # end

end
