require "sinatra"
require "sinatra/reloader"

class ScrabbleSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    erb :score
  end
end
