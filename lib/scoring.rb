class Scrabble
  # SCORE is constant within the class-- tiles always have the same value
  SCORE = {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1,
           "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
           "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3,
           "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4,
           "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" =>10,
           "z" => 10
  } # can also use "a": 8 instead of hash rockets

  # can do word.downcase! to mutate the whole word-- may mess with the call --
  # may be a little less efficient to do downcase for each in line 21

  def self.score(word)
    total_points = 0
    # check to see that the input is actually a string (not nil or a number)
    raise ArgumentError.new "You can only use strings" unless word.class == String

    # check that the string only contains valid English letters, no numbers or symbols, controls for case
    word_array = word.chars.map { |each| each.downcase }
    raise ArgumentError.new "You can only use standard English letters" unless word_array.all? { |letter| SCORE[letter] }

    # check that the string is between 1 and 7 letters
    raise ArgumentError.new "You must play between 1 and 7 letters" unless word_array.length >= 1 && word_array.length <= 7

    # Finally a valid word! Assigning a point value to each letter in the array
    word_array.each do |letter|
      points = SCORE[letter]
      # adds points for each letter to a total_points variable
      total_points += points
      # should be able to just do total_points += SCORE[letter]
    end

    return total_points
  end

  def self.score_multiple(words)
    words = words.split(", ")
    scores = {}
    words.each do |word|
      scores[word] = score(word)
    end

    return scores
  end
end
