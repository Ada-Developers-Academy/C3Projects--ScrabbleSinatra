require "sinatra"
require "sinatra/reloader"
require "./lib/Scrabble"


class ScrabbleSinatra < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :home

  end

  get "/score" do
    erb :score
  end

  post "/score" do
    erb :score
    @word = params[:word]
    # why do we need the @ sign?
    # @score = Scrabble::Scrabble.score(@word)
  end

end
