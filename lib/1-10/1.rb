# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

def fizz_buzz_sum(n)
  multiples = (0...n).select { |x| x % 3 == 0 || x % 5 == 0 }
  multiples.reduce(:+)
end

puts fizz_buzz_sum(1000)
