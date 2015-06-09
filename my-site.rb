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
    @word_score = Scrabble::Scrabble.score(word)

    erb :score_word
  end

  get "/score_multiple_words" do
    erb :score_multiple_words
  end

  post "/score_multiple_words" do
    @no_words = params["number"].to_i

    if params["words"]
      # {"words"=>["sadfkjh", ";kjl;kj", " lk;j;lkj", "cjhsg", "893u4t", "", "", "", "", "", ""]}
      words = params["words"]
      @scores = Scrabble::Scrabble.score_multiple_words(words)
    end

    erb :score_multiple_words
  end


  # strip spaces?
end
