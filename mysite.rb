require 'sinatra'
require 'sinatra/reloader'
require './lib/scrabble'

class MySite <Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
    word_array = params[:words].split(" ")
    score_method = params[:score_method]
    @display_array = ScrabbleSinatra::ScrabbleSinatra.scoring(word_array, score_method)
    erb :score
  end
end
