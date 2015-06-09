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
    @title = "Score"
    @word = params[:word]
    @score = Scrabble.score(@word)
    erb :score
  end

  get '/score_multiple' do
    @title = "Score multiple words"
    erb :score_multiple
  end

  post '/score_multiple' do
    @title = "Score multiple words"
    @words = params[:list_of_words].split(" ")
    @scored_words = {}
    @words.each do |word|
      @scored_words[word] = Scrabble.score(word)
    end
    erb :score_multiple
  end
end
