# It is possible to show that the square root of two can be expressed as an infinite continued fraction.
#
# √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
#
# By expanding this for the first four iterations, we get:
#
# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
#
# The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.
#
# In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

require_relative '../utility_functions'

#Old approach, which didn't work
# def square_root_of_two_expansion (depth)
#   if depth == 1
#     return BigDecimal.new("0.5")
#   else
#     return BigDecimal.new("1.0")/(BigDecimal.new("2.0") + square_root_of_two_expansion(depth - BigDecimal.new("1.0")))
#   end
# end
#
# def expansions (limit)
#   decimal_expansions = []
#   (1..limit).each do |depth|
#     decimal_expansions << BigDecimal.new("1.0") + square_root_of_two_expansion(depth)
#   end
#
#   decimal_expansions
# end

def expansion(limit)
  larger_numerators = 0
  numerator = 3
  denominator = 2

  (1..limit).each do |depth|
    numerator += 2 * denominator
    denominator = numerator - denominator
    if numerator.digits > denominator.digits
      larger_numerators += 1
    end
  end

  larger_numerators
end

puts expansion(1000)
