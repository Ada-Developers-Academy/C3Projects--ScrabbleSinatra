require "sinatra"
require "sinatra/reloader"
require "./lib/scoring"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
  	@word = params[:word]
  	@score = Scrabble::Scrabble.score(@word)
  	erb :score
  end

  get "/multi_score" do
  	erb :multi_score
  end

end
