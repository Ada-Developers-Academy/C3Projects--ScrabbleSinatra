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
    @word_score = Scrabble::Scrabble.score(@word)
    @letters = @word.chars
    @scores = Scrabble::Scrabble.get_score_array(@word)
    erb :score
  end

  get "/werdz" do
    @words = []
    erb :werdz
  end

  post "/werdz" do
    @input = (params[:words])
    @words = @input[0].split(",")
  erb :werdz
  end

end
