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

  # * make dummy link index page
  # * make form on score page for entering word
  # * make sure that we take input, use rb file to score word, then update page w/ score/result
end
