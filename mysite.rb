require 'sinatra'
require 'sinatra/reloader'
require './lib/scrabble'

class MySite <Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    word_array = params[:words].split(" ")
    score_method = params[:score_method]
    display_array = ScrabbleSinatra::ScrabbleSinatra.scoring(word_array, score_method)
      erb :score, :locals => {:display => display_array}
  end
end
