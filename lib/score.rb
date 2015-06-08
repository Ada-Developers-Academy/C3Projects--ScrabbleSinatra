module Scrabble

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
      check_word
    end

    def self.check_word
    end

  end
end