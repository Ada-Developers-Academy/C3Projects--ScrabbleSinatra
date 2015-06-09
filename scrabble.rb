require 'sinatra'
require 'sinatra/reloader'
require './lib/score_logic'

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
    @word  = params[:word]
    @score = Scrabble::Scrabble.score(@word)
    erb :score
  end

end
