module Scrabble

  # constant scoring for scrabble
 LETTERS = {
   1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
   2=> ["D", "G"],
   3=> ["B", "C", "M", "P"],
   4=> ["F", "H", "V", "W", "Y"],
   5=> "K",
   8=> ["J", "X"],
   10=> ["Q", "Z"]
 }

  class Scrabble

    def self.is_valid?(input_letters)
    # confirming that input is valid, only accepting letters

      if input_letters == []
        return "please type something in."
        exit
      end

      possible_letters = %w(Q W E R T Y U I O P A S D F G H J K L Z X C V B N M)

      input_letters.each do |letter|

        if possible_letters.include?(letter)
          return input_letters
        else
          return "Error, not valid letters."
          exit
        end
      end

    end

    def self.score(word)
      total_points = 0
      points_array = []
      word.upcase!
      input_letters = letter_array(word)
      # calling the validating method is_valid?(word)
      is_valid?(input_letters)
      letter_scoring(input_letters)

      points_array.each do |point_value|
        total_points += point_value
      end

      return total_points
    end

    def self.letter_scoring(input_letters)

      input_letters.each do |letter|
        LETTERS.each do |points, letters|
          if letters.include?(letter)
            points_array.push(points)
          end
        end
      end
      return points_array
    end

    def self.letter_array(word)
      # splitting word into an array of letters
      word.split(//)
    end

    # def self.letter_score_array
    #
    # end


    def self.split_words(words)
      # to split textarea words into an array so we can score them individually
      array_of_words = words.split(" ")
      return array_of_words
    end



    def self.highest_score_from(array_of_words)
    # return the word with the highest score (with caveats)
      scrabble_hash = {}
      hi_score_array = []

      array_of_words.each do |word|
        score = 0
        # calling self.score to score the words from array
        score = score(word)
        # scrabble_hash will be key = word, value = score
        scrabble_hash[word] = score
      end

      # # Find the highest score from the scrabble_hash
      # hi_score = scrabble_hash.max_by {|word, score| score} # returns hi_score array
      #
      # scrabble_hash.each do |word, score|
      #   if score == hi_score[1]
      #   # when the score = hi_score, push word into the array
      #     hi_score_array.push(word)
      #   end
      # end
      #
      # hi_score_array.each do |word|
      # # if the length of the word is 7, it's the winner!
      #   if word.length == 7
      #     return word
      #   end
      # end
      #
      # # the winner is the max score with the least amount of letters
      # winner_word =  hi_score_array.min_by {|word| word.length}
      # return winner_word
      return scrabble_hash
    end

  end

end
