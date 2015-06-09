require 'sinatra'
require 'sinatra/reloader'
require './lib/score_logic'

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    @letters = []
    erb :score
  end

  post "/" do
    @word  = params[:word]
    @score = Scrabble::Scrabble.score(@word)
    @letters = @word.chars
    @scores = Scrabble::Scrabble.get_score(@word)
    erb :score
  end

  # get "/werdz" do
  #
  #   erb :werdz
  # end
  #
  # post "/werdz" do
  #
  #   erb :werdz
  # end

end
