require "sinatra"
require "sinatra/reloader"
require "./lib/scoring"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
  	@word = params[:word]
  	@score = Scrabble::Scrabble.score(@word)

  	erb :score
  end

  get "/multi_score" do
  	@hash_of_words_and_scores = {}
    erb :multi_score
  end

  post "/multi_score" do
    @words = params[:words]
    @word_array = Scrabble::Scrabble.create_word_array(@words)

    @hash_of_words_and_scores = Scrabble::Scrabble.score_words(@word_array)

  	erb :multi_score
  end

end
