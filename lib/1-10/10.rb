# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

require_relative '../../utility_functions'

puts (Prime.first 200000).select{|p| p < 2000000}.reduce(:+)
