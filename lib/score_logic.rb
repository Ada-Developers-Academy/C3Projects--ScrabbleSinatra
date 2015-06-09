module Scrabble

SCOREBOARD = {
  "A" => 1, "E" => 1, "I" => 1, "O" => 1,
  "U" => 1, "L" => 1, "N" => 1, "R" => 1,
  "S" => 1, "T" => 1, 
  "D" => 2, "G" => 2,
  "B" => 3, "C" => 3, "M" => 3, "P" => 3,
  "F" => 4, "H" => 4, "V" => 4, "W" => 4,
  "Y" => 4, 
  "K" => 5, 
  "J" => 8, "X" => 8, 
  "Q" => 10, "Z" => 10,
}

class Scrabble
  attr_reader :word

  def initialize(word) #instantiate scrabble to get the word in here
    @word = word
  end

  def self.letters_in_word
    return @word.split(//)
  end

  def self.score

    # return "Must pick a letter!" unless word[/[a-zA-Z]+/] == word && word.length > 0
    # #If the input is a character that isn't a letter, or if it's an empty string, it brings up an error

    # empty array to iterate through each letter of the split word
    score_array = []

    #assign split word array to a variable
    split_letter_array = letters_in_word(@word)

    #for each letter in the array of individual letters, I pushed the matching letters from SCOREBOARD to score_array
    #SCOREBOARD[letter.upcase] gives me the score value from my SCOREBOARD hash
    split_letter_array.each do |letter|
      score_array.push(SCOREBOARD[letter.upcase])
    end


    sum = 0
    # for each letter
    score_array.each do |score|
      sum += score.to_i #adds all the letter scores together
    end
    #returns the sum/score of all letters
    return sum

  end
end

end
