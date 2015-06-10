module Scrabble

  class Scrabble
    # Set constants with general error message, point values of each letter, all letters
    WORD_ERROR = "ERROR: Invalid input. Either your word has more that 7 letters or you entered something ridiculous. You only have 7 tiles, and Scrabble uses WORDS!"
    POINTS = {
      1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
      2 => ["d", "g"],
      3 => ["b", "c", "m", "p"],
      4 => ["f", "h", "v", "w", "y"],
      5 => ["k"],
      6 => ["j", "x"],
      7 => ["q", "z"]
    }

    LETTERS = ("a".."z").to_a

    def self.get_points(word)
      # set initial value of score
      score = 0

      # convert to string, make letters lower case, & push letters to array
      word_array = word.downcase.chars

      # for each letter in word_array, check POINTS and add to total to create score
      word_array.each do |letter|
        for num in 1..7
          if POINTS[num].include?(letter)
            score += num
          end
        end
      end
      return score
    end

    # Check input to guard against empty, nil, or otherwise invalid parameter
    # Word length cannot exceed 7
    def self.valid_input?(word)
      word = word.to_s.downcase

      if (word == "") || (word == nil) || (word.length > 7) || (word.chars.all? { |letter| !LETTERS.include?(letter) })
        valid = false
      else
        valid = true
      end
    end

    def self.score(word)
      # error if invalid input
      if self.valid_input?(word) == false
        WORD_ERROR

      # run get_points if valid input
      else
        self.get_points(word)
      end
    end

    def self.scorer(words)
      @score_hash = {}
      @words.each do |word|
        @score = score(word)
        @score_hash[word] = @score
      end
      return @score_hash
    end

    def self.score_words(words)
      @words = words.split(",")
      @words = @words.map { |word| word.strip }
      if @words.all? { |word| self.valid_input?(word)}
        # if self.valid_input?(word) == true
        self.scorer(@words)
      else
        WORD_ERROR
      end
    end

  end

end
