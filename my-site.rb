require "sinatra"
require "sinatra/reloader"
require './lib/scrabble'

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :home
  end

  get"/score" do
    erb :score 
  end 

  post "/score" do
    @word = params[:scrabble][:word]
    params[:scrabble][:score] = Scrabble::Scrabble.score(@word)
    @score = params[:scrabble][:score]
    erb :score
  end

end
