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
    erb :one_word
  end

  get '/multiple_words' do
    erb :multiple_words
  end

  post '/multiple_words' do
    @words = params[:words]
    # returns an array of scores
    @scores = Scrabble.score_multiple(@words)
    erb :multiple_words
  end
end
