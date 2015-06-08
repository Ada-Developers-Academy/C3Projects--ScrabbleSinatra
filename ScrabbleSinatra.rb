require "sinatra"
require "sinatra/reloader"


class ScrabbleSinatra < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :scrabble

  end

end
