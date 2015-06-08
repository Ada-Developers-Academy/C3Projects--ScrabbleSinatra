require 'sinatra'
require 'sinatra/reloader'
require './lib/score.rb'

class ScrabbleSinatra < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :home
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    erb :score
  end

end
