require "sinatra"
require "sinatra/reloader"
require "./lib/scoring.rb"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    erb :home
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @word = params[:word]
    @score = Scrabble.score(@word)
    erb :score
  end
end
