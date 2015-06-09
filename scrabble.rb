  require_relative 'score/scrabble_score'
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

    def output_score
      score_line = ""
      if @word.nil? == false
        @score_line = "The word '#{@word}' scores #{@score} points."
      else
        @score_line = score_line
      end
    end

    # posting a message only if there is a score available
    post "/score" do
      @word = params[:word]
      @score = Scrabble::Scrabble.score(@word)
      output_score
      erb :score
    end


  end
