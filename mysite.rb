require 'sinatra'
require 'sinatra/reloader'
require './lib/scrabble'

class MySite <Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
    @word_array = [params[:word]]
    @score_method = params[:score_method]
    erb :score
  end

  get "/more_words" do
    erb :more_words
  end

  post "/more_words" do
    @word_array = params[:words].split(" ")
    @score_method = params[:score_method]
    erb :more_words
  end

end
