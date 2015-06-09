require "sinatra"
require "sinatra/reloader"
require_relative "./lib/scrabble"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/score_word" do
    erb :score_word
  end

  post "/score_word" do
    word = params["word"]
    score = Scrabble::Scrabble.score(word)
    if score.class == Fixnum
      @output = "#{ word.capitalize } is worth #{ score } points."
    else
      @output = score
    end

    erb :score_word
  end

  # create page
  # create route
  # create view for multiple words

  # create letter by letter breakdown
  #    rewrite the current scoring method to return array

  # then worry about partials b/c it says DRY
end
