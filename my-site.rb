require "sinatra"
require "sinatra/reloader"
require "./lib/scoring.rb"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    erb :home
  end

  get '/one_word' do
    erb :one_word
  end

  post '/one_word' do
    @word = params[:word]
    @score = Scrabble.score(@word)
    @letter_with_points = Scrabble.letter_values(@word)
    erb :one_word
  end

  get '/multiple_words' do
    erb :multiple_words
  end

  post '/multiple_words' do
    @words = params[:words].split(", ")
    # returns a hash of word-score key-value pairs
    @scores = Scrabble.score_multiple(@words)
    @all_the_letter_points = Scrabble.all_letter_values(@words)
    erb :multiple_words
  end
end
