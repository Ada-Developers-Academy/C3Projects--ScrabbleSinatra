module Scrabble

  require "pry"

  class ScoreWord

    VALUE = { 
           1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
           2 => ["d", "g"], 
           3 => ["b", "c", "m", "p"],
           4 => ["f", "h", "v", "w", "y"],
           5 => ["k"],
           8 => ["j", "x"],
           10 => ["q", "z"]
          }

    def self.score_word(word)
      word_score = 0
      word.each_char do |char|
        VALUE.each do |k, v|
          if v.include?(char)
            word_score += k
          end
        end
      end
      return word_score
    end

    def self.check_word
    end

  end
end