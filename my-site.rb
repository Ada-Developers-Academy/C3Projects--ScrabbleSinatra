require "sinatra"
require "sinatra/reloader"

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
    @title = "Score"
    erb :score
  end
end
