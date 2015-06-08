class Scrabble

 	POINTS = {
	  	"a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1, "f" => 4,
	  	"g" => 2, "h" => 4, "i" => 1, "j" => 8, "k" => 5, "l" => 1,
	  	"m" => 3, "n" => 1, "o" => 1, "p" => 3, "q" => 10, "r" => 1,
	  	"s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4, "x" => 8,
	  	"y" => 4, "z" => 10
  	}

  	VALID_LETTERS = POINTS.keys.reduce(:+)

  	# def initialize
  	# end

 	def self.process_input(word)
 		word_letters = word.downcase.split("")
 	end


	def self.valid_input?(word)
  		# guard clause for empty string or nil input
	  	return false if word == "" || word == nil

	  	word_letters = self.process_input(word)
	  	return false if word_letters.find { |letter| !VALID_LETTERS.include?(letter) }
		
	  	true
  	end

  	def self.check_length(word)
	  	return false unless word.length <= 7
	  	true
  	end

	def self.get_points(word)
	  	word_letters = Scrabble.process_input(word)

	  	word_score = word_letters.inject(0) do |sum, letter|
	  		sum + POINTS[letter]
	  	end
	end

  	def self.score(word)
	  	# guard clause for non-alphabetic user input
  		return "ERROR -- invalid input" unless Scrabble.valid_input?(word)

  		# guard clause for word over 7 letters
  		return "ERROR -- too long" unless Scrabble.check_length(word)

  		# return score for valid word
  		Scrabble.get_points(word)
  	end
end