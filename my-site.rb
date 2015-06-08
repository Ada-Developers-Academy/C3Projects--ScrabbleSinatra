require "sinatra"
require "sinatra/reloader"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    erb :home
  end

  get '/score' do
    erb :score
  end

end
