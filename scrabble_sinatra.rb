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
    @score = Scrabble::Score.score_word(params[:word][0])
    @letter_score = Scrabble::Score.score_word_by_letter(params[:word][0])

    erb :score
  end

  get "/score_multiple" do
    erb :score_multiple
  end

  post "/score_multiple" do
    @array_words = params[:words]

    @scores = Scrabble::Score.score_array_of_words(params[:words])
    @letter_scores = Scrabble::Score.score_letters_in_array(@array_words)
    erb :score_multiple
  end

end
