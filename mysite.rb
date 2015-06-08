require 'sinatra'
require 'sinatra/reloader'
require './lib/scrabble'

class MySite <Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
    @word = params[:word]
    @score = ScrabbleSinatra::ScrabbleSinatra.score(@word)

    erb :score
  end

  get "/more_words" do
    erb :more_words
  end

  post "/more_words" do
    @words = params[:words].split(" ")
    # @words needs to be an array
    @words_scores = ScrabbleSinatra::ScrabbleSinatra.score_multiple( @words )

    erb :more_words
  end

end
