require 'sinatra'
require 'sinatra/reloader'
require './lib/score_logic'

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    @word = Scrabble::Scrabble.new(params[:word])
    erb :score
  end

end
