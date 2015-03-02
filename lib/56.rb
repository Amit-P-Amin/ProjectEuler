# A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

require_relative '../utility_functions'

def exponands(a, b)
  results = []

  (1..a).each do |a|
    (1..b).each do |b|
      results << a ** b
    end
  end

  results
end

puts exponands(99, 99).map {|n| n.digit_sum}.sort.last
