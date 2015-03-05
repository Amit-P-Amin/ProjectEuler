# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require_relative '../../utility_functions'

def amicables
  amicables = []
  (4..10000).each do |num|
    num_1 = num
    factor_sum_1 = num_1.divisors.reduce(:+)
    num_2 = factor_sum_1
    factor_sum_2 = num_2.divisors.reduce(:+)
    if num_1 == factor_sum_2 && num_2 == factor_sum_1 && factor_sum_2 < 10000 && num_2 < 10000 && num_1 != num_2
      amicables << num_1
      amicables << num_2
    end
  end

  amicables.compact.sort.uniq
end

p amicables.reduce(:+)
