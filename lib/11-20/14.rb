# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

require_relative '../../utility_functions'

def collatz_terms(num)
  count = 1
  while num != 1
    if num.even?
      num = num / 2
    else
      num = num * 3 + 1
    end
    count += 1
  end

  count
end

def longest_terms(limit)
  longest = 0
  best_num = 0
  (1..limit).each do |num|
    if collatz_terms(num) > longest
      longest = collatz_terms(num)
      best_num = num
    end
  end

  best_num
end

p longest_terms(1000000)
