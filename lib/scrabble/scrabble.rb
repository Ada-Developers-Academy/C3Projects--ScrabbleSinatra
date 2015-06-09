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

    EMPTY_WORD_ERROR = "Please enter a word before hitting the Score Word button."

    LONG_WORD_ERROR = "Please enter a word that has 7 letters or fewer."

    BAD_CHARACTER_ERROR = "Please only put letters in your word."


    def self.score_letter(letter)
      LETTER_SCORES.each do |set|
        if set[:letters].include? letter
          return set[:points]
        end
      end
    end

    def self.empty?(word)
      if word.length == 0
        return true
      else
        return false
      end
    end

    def self.long?(word)
      if word.length > 7
        return true
      else
        return false
      end
    end

    def self.bad_character?(char)
      if (char >= "a") && (char <= "z")
        return false
      else
        return true
      end
    end


    def self.score(word)
      # converts numbers to strings, so they'll get kicked out .each_char loop below. (lines 46-53)
      word = word.to_s

      word_score_hash = {
        word: word,
        letters: []
      }

      # words must have at least one letter!
      if Scrabble.empty?(word)
        word_score_hash[:error] = EMPTY_WORD_ERROR
        return word_score_hash
      end


      # handling anything too long or short to be a legal word
      if Scrabble.long?(word)
        word_score_hash[:error] = LONG_WORD_ERROR
        return word_score_hash
      end

      # if a word gets this far, it should be a word!
      word.downcase! # so get rid of any ridiculous uppercase letters.

      word_score = 0 # let's start counting from nothing!

      word.each_char do |char|
        unless Scrabble.bad_character?(word)
          letter_score = score_letter(char)
          word_score_hash[:letters].push({
            letter: char,
            score: letter_score
          })

          word_score += letter_score # and then add to it as letters appear.
        # handling for letters outside legal a-z range.
        else
          word_score_hash[:error] = BAD_CHARACTER_ERROR
          return word_score_hash
        end
      end

      word_score_hash[:score] = word_score
      return word_score_hash # since we're out of letters, you can have your score back.
    end

    def self.score_multiple_words(words_array)
      # we know we can use shift to take the first item and pop it off
      # we also know we can use sort! to get all the empty strings to the front / left / first positions
      words_array.sort!

      while words_array[0] == ""
        words_array.shift
      end

      scores_array = words_array.map do |word|
        Scrabble.score(word)
      end

      return scores_array
    end

  end # class
end # module
