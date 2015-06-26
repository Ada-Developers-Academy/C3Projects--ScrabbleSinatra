# require 'pry'
module Scrabble
  class Score

  SCORE_CHART = {
       1  => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
       2  => ["D", "G"],
       3  => ["B", "C", "M", "P"],
       4  => ["F", "H", "V", "W", "Y"],
       5  => ["K"],
       8  => ["J", "X"],
       10 => ["Q", "Z"]
     }


     # method to determine score of individual letter
     def self.score_letter(letter)
         # runs through the SCORE_CHART hash
         SCORE_CHART.each do |point_value, corresponding_letters|
           # if the given letter matches up with a letter in the array, then return the corresponding point value
           if corresponding_letters.include?(letter)
             return point_value
           end
         end
     end


     # method to return the total score of a word
     def self.score_word(word)
       # ensures entire string is uppercase
       word = word.upcase

       # initialize total score of the word to zero
       total_word_score = 0

       # splits the word into single letters and loops through each letter
       word.split("").each do |letter|
         # gets the score value for the letter and adds it to the total word score
         letter_score = score_letter(letter)
         total_word_score += letter_score
       end

       return total_word_score
     end


     def self.score_word_by_letter(word)
      # final_array = [["c", 3], ["a", 1], ["t", 1]]
      final_array = [ ]

      letters = word.upcase.split("")

      letters.each do |letter|
        inside_array = [ ]
        inside_array.push(letter)
        inside_array.push(self.score_letter(letter))
        final_array.push(inside_array)
      end

      return final_array
     end


     def self.score_array_of_words(array)
      # final_array = [["candy", 11], ["apple", 9], ["whatever, 17"]]
      final_array = [ ]

      array.each do |word|
        inside_array = [ ]
        inside_array.push(word)
        inside_array.push(self.score_word(word))
        final_array.push(inside_array)
      end

      return final_array
     end


   def self.score_letters_in_array(array)
    final_array = []

    array.each do |word|
      final_array.push(self.score_word_by_letter(word))
    end
    return final_array
   end

    #  binding.pry

  end
end
