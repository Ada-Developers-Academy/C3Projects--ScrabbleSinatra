require 'sinatra'
require 'sinatra/reloader'
require './lib/score_logic'

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    @scored_word = Scrabble::Scrabble.new(params[:word])
    erb :score
  end

  post "/" do
    @scored_word  = params[:word]
    @score        = params[:score]
    erb :score
  end

end
