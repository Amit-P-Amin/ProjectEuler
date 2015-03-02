# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

require_relative '../utility_functions'

def products(digits)
  numbers = []
  (10**(digits-1)...10**(digits)).each do |num1|
    (10**(digits-1)...10**(digits)).each do |num2|
      numbers << num1 * num2
    end
  end

  numbers.uniq
end

puts products(3).select {|n| n.palindrome?}.sort.last
