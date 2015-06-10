require_relative "./score.rb"
module Scrabble
  class MultiWord

    def self.array_of_words(string)
      words_array = string.split(", ")
    end

    def self.score_multi_words(string)
      words_array = array_of_words(string)
      word_scores = {}
      words_array.each do |word|
        score = Scrabble::ScoreWord.score_word(word)
        if score.nil?
          return nil
        else
          word_scores[word.to_sym] = score 
        end
      end
      return word_scores
    end
  end
end