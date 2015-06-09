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
    @word = params["word"]

    erb :score_word
  end
end
