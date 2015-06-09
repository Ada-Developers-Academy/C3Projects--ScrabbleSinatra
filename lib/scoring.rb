module Scrabble

  VALUES = {"a"=> 1, "b"=> 3, "c"=> 3, "d"=> 2, "e"=> 1, "f"=> 4, "g"=> 2, "h"=> 4, "i"=> 1, "j"=> 8, "k"=> 5, "l"=> 1, "m"=> 3, "n"=> 1, "o"=> 1, "p"=> 3, "q"=> 10, "r"=> 1, "s"=> 1, "t"=> 1, "u"=> 1, "v"=> 4, "w"=> 4, "x"=> 8, "y"=> 4, "z"=> 10}

  class Scrabble

    def self.score(word)
      word = word.downcase

      if word.length > 7 || word.length < 1
        return "Error"
      end

      word_array = word.split(//) # makes an [] with each letter as its own element
      word_array.each do |character|
        unless ("a".."z").include?(character)
          return "Error"
        end
      end

      word_score = 0
      word.each_char do |letter|
        VALUES.each do |key, value|
          if letter == key
            word_score += value
          end
        end
      end

      return word_score
    end

		def self.create_word_array(user_words)
			word_array = user_words.split(" ")
			return word_array
		end

		def self.score_words(array_of_words)
			array_of_values = []
			array_of_words.collect do |word|
				value = self.score(word)
				array_of_values.push(value)
			end
			# return array_of_values
			hash_of_words = Hash[array_of_words.zip array_of_values]#return hash_of_words with the words as the keys and their point value as the value
			return hash_of_words
		end

		def self.print_scores(hash_of_words)
			hash_of_words.each do |key, value|
				puts "#{key}:#{value}"
			end
		end

  end # Scrabble class
end # Scrabble module
