  require_relative 'score/scrabble_score'
  require "sinatra"
  require "sinatra/reloader"

  class Scrabble < Sinatra::Base
    register Sinatra::Reloader

    get "/" do
      erb :index
    end

    get "/score" do
      erb :score
    end

    post "/score" do
      @word = params[:word]
      @score = params[:score]
      erb :score
    end

  end
