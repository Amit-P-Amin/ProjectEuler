# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


def to_word(number)

  dictionary = { 1 => "one", 2 => "two", 3 => "three",
    4 => "four", 5 => "five", 6 => "six",
    7 => "seven", 8 => "eight", 9 => "nine",
    10 => "ten", 11 => "eleven", 12 => "twelve",
    13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
    16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
    19 => "nineteen", 20 => "twenty", 30 => "thirty",
    40 => "forty", 50 => "fifty", 60 => "sixty",
    70 => "seventy", 80 => "eighty", 90 => "ninety",
    100 => "hundred", 1000 => "thousand" }

  word = ""

  characters = number.to_s.reverse.split(//).map { |char| char.to_i }

  if (characters[3] != nil and characters[3] != 0)
    word = dictionary[characters[3]] + " thousand "
  end

  if (characters[2] != nil and characters[2] != 0)
    word += dictionary[characters[2]] + " hundred"

    if (characters[1] != nil and characters[1] != 0)
        word += " and"
    elsif characters[0] != nil and characters[0] != 0
        word += " and"
    end
  end

  tens_position_value = 99
  if (characters[1] != nil and characters[1] != 0)
    tens_position_value = characters[1] * 10 + characters[0]

    if tens_position_value <= 20
      word += " " + dictionary[tens_position_value]
    else
      word += " " + dictionary[(characters[1] * 10)]
    end
  end

  if (characters[0] != nil and characters[0] != 0 and tens_position_value > 20)
      word += " " + dictionary[characters[0]]
  end

  word.strip
end

def to_word_length(number)
 to_word(number).gsub(/ /,'').length
end


puts (1..1000).inject(0) { |sum, number| sum + to_word_length(number) }
