require "sinatra"
require "sinatra/reloader"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
    @word = params[:word]
    # we eventually want to do this below
    # @score = params[:scrabble][:score]
    erb :score
  end

end

# params hash
# {
#   scrabble: {
#     word: "word input",
#     score: "score output"
#   }
#
# }
