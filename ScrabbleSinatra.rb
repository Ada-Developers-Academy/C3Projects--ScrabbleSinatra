require "sinatra"
require "sinatra/reloader"
require "./lib/Scrabble"

class ScrabbleSinatra < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :home
  end

  get "/score" do
    erb :score
  end

  post "/score" do
    @word = params[:word]
    # Using instance variable because refering to @word on score.erb.
    # If local variable, score.erb is outside the scope.
    @score = Scrabble::Scrabble.score(@word)
    @letters = Scrabble::Scrabble.letter_array(@word)
    @letter_scoring = Scrabble::Scrabble.letter_scoring(@letters)
    erb :score

  end

  get "/multi_score" do
    erb :multi_score
  end

  post "/multi_score" do
    @words_hash = {}
    @words = params[:words]
    @word_array = Scrabble::Scrabble.split_words(@words)
    @total_score = Scrabble::Scrabble.score(@words)

    # for each word in the @word_array, get letter and letter scores into individual arrays
    # is below display logic? Or should this be in a .rb file?
    @word_array.each do |word|
      @score = Scrabble::Scrabble.score(word)
      @letters = Scrabble::Scrabble.letter_array(word)
      @letter_scoring = Scrabble::Scrabble.letter_scoring(@letters)
      @words_hash[word] = [@score, @letters, @letter_scoring]
    end

    erb :multi_score_result
  end

end
