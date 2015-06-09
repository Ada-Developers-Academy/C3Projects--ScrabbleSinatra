require 'sinatra'
require 'sinatra/reloader'
require './lib/score.rb'

class ScrabbleSinatra < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :home
  end

  get "/score" do
    erb :score
  end

  post "/score" do

    @word = params[:word][0]
    @score = Scrabble::Score.score(params[:word][0])
    @letter_score = Scrabble::Score.score_word_by_letter(params[:word][0])

    erb :score
  end

end
