require "sinatra"
require "sinatra/reloader"
require_relative "./lib/score.rb"

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
end
