require "sinatra"
require "sinatra/reloader"
require_relative "./lib/score.rb"
require_relative "./lib/multi_word.rb"

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @final_score = Scrabble::ScoreWord.score_word(params[:word])
    erb :score
  end

  get "/multi_word" do
    erb :multi_word
  end

  post "/multi_word" do
    @final_words_score = Scrabble::MultiWord.score_multi_words(params[:words])
    erb :multi_word
  end
end
