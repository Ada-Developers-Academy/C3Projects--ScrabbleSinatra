require "sinatra"
require "sinatra/reloader"
require_relative "./lib/scrabble"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/score_word" do
    erb :score_word
  end

  post "/score_word" do
    word = params["word"]
    word_score = Scrabble::Scrabble.score(word)
    if word_score.class == Hash
      @output = "#{ word_score[:word].capitalize } is worth #{ word_score[:score] } points."
    else
      @output = word_score
    end

    erb :score_word
  end

  get "/score_multiple_words" do
    erb :score_multiple_words
  end

  # post "/score_how_many_words" do
  #   erb :score_multiple_words
  # end

  post "/score_multiple_words" do
    @no_words = params["number"].to_i

    if params["words"]
      # {"words"=>["sadfkjh", ";kjl;kj", " lk;j;lkj", "cjhsg", "893u4t", "", "", "", "", "", ""]}
      words = params["words"]
      @scores = Scrabble::Scrabble.score_multiple_words(words)
    end

    erb :score_multiple_words
  end

  # create view for multiple words
  # create page
  # create route

  # create letter by letter breakdown
  #    rewrite the current scoring method to return array

  # then worry about partials b/c it says DRY
end
