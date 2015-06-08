require "sinatra"
require "sinatra/reloader"

class Scrabble < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

end 
