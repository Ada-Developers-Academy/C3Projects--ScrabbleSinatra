module Scrabble

  class ScoreWord

    VALUE = {
           1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
           2 => ["d", "g"],
           3 => ["b", "c", "m", "p"],
           4 => ["f", "h", "v", "w", "y"],
           5 => ["k"],
           8 => ["j", "x"],
           10 => ["q", "z"]
          }

    def self.score_word(word)
      word.downcase!
      if check_word(word).nil?
        return nil
      end
      word_score = 0
      word.each_char do |char|
        word_score += score_letter(char)
      end
      return word_score
    end

    def self.score_letter(char)
      VALUE.each do |k, v|
        if v.include?(char)
          return k
        end
      end
    end

    def self.check_word(word)
      if word.nil? || word == "" || word.length > 7 || check_char(word).nil?
        return nil
      else
        return word
      end
    end

    def self.check_char(word)
      
      word.each_char do |char|
        unless ("a".."z").include?(char)
          return nil
        end
      end

      return word
    end

  end
end
