require "sinatra"
require "sinatra/reloader"
require "./lib/scrabble"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
  	@title = "Home"
	   erb :home
  end

  get '/score' do
    @title = "Score"
    erb :score
  end

  post '/score' do
  	# call on scrabble.rb file here

    @title = "Score"
    erb :score
  end
end
