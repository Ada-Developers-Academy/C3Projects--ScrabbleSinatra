module Scrabble
  class Scrabble
    ## -------------------------------------------------------------------------
    # CONSTANTS


    LETTER_SCORES = [
      { points: 1,  letters: %w{a e i o u l n r s t} },
      { points: 2,  letters: %w{d g} },
      { points: 3,  letters: %w{b c m p} },
      { points: 4,  letters: %w{f h v w y} },
      { points: 5,  letters: %w{k} },
      { points: 8,  letters: %w{j x} },
      { points: 10, letters: %w{q z} }
    ]


    def self.score_letter(letter)
      LETTER_SCORES.each do |set|
        if set[:letters].include? letter
          return set[:points]
        end
      end
    end
    

    def self.score(word)
      # first: raise some noise about nil values
      if word == nil
        return "WORDS SHOULD NOT BE NOTHING!"
      end

      # first: format word
      word = word.to_s # handling for numbers (fixednum, floats)

      # handling anything too long or short to be a legal word
      if (word.length > 7) || (word.length == 0)
        return "INVALID WORD!"
      end

      # if a word gets this far, it should be a word!
      word.downcase! # so get rid of any ridiculous uppercase letters.

      word_score = 0 # let's start counting from nothing!

      word.each_char do |char|
        if (char >= "a") && (char <= "z")
          word_score += score_letter(char) # and then add to it as letters appear.
        # handling for letters outside legal a-z range.
        else
          return "THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD!"
        end
      end

      return word_score # since we're out of letters, you can have your score back.
    end

  end
end
