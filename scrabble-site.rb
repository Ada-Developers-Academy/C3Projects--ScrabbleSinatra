require "sinatra"
require "sinatra/reloader"

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end
end
