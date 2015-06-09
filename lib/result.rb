module Scrabble
  class Scrabble

    #each letter has a corresponding point value
    CONVERSIONS = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 8,
      "Y" => 4,
      "Z" => 10,
    }

    #this function will take the word user puts in ()
    #and will use the split method to break up the word
    #into separate letters in an array and then perform a
    #loop that will run through each letter and get a value
    #from the conversion table and add each value together to
    #get a total sum of points for entire word and then returns
    #that total value
    def self.score (word)
      sum = 0
      word = word.upcase
      word.split(//).each do |letter|
        sum = sum + CONVERSIONS[letter]
      end
      return sum
    end
  end
end
  puts Scrabble::Scrabble.score("word")
