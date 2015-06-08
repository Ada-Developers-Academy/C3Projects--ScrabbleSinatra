require "sinatra"
require "sinatra/reloader"


class ScrabbleSinatra < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :home

  end

  get "/score" do
    erb :score
  end

  post "/score" do
    erb #SOMETHING
  end

end
