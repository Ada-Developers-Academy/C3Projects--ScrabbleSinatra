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

    get "/score_words" do
      erb :score_words
    end

    def output_score(word)
      @word = word
      score_line = ""
      unless @word.nil?
        @score_line = "The word '#{@word}' scores #{@score} points."
      else
        @score_line = score_line
      end
    end

    # posting a message only if there is a score available
    post "/score" do
      @word = params[:word]
      @score = Scrabble::Scrabble.score(@word)
      output_score(@word)
      erb :score
    end

    post "/score_words" do
      @words = params[:words].split(",")
      @score_hash = {}
      @words.each do |word|
        @score = Scrabble::Scrabble.score(word)
        @score_hash[word] = @score
        # output_score(word)
      end
      # @scored_words = Scrabble::Scrabble.highest_score_from(@words)
      erb :score_words
    end


  end
