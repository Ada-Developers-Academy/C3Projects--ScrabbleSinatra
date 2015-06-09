require "sinatra"
require "sinatra/reloader"
require "./lib/result.rb"

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
    @answer = Scrabble::Scrabble.score(@word)
    erb :score
  end

  get '/lotsa' do
    erb :lotsa
  end

  post '/lotsa' do
    @wordarray = params[:morewords]
    @manyscores = []
    @wordarray.each do |word|
      @manyscores.push (Scrabble::Scrabble.score(word))
    end

    erb :lotsa
  end

end
