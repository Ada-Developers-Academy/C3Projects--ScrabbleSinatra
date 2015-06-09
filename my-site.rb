require "sinatra"
require "sinatra/reloader"
require './lib/scrabble'

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
    @word = params[:scrabble][:word]
    params[:scrabble][:score] = Scrabble::Scrabble.score(@word)
    @score = params[:scrabble][:score]
    erb :score
  end

end
