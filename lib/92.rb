# A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.
#
# For example,
#
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
#
# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
#
# How many starting numbers below ten million will arrive at 89?

#+++++UNSOLVED++++++#

require_relative '../utility_functions'

def next_chain_number(old_number)
  next_number = 0

  while old_number > 0
    digit = old_number % 10
    next_number += digit * digit
    old_number /= 10
  end

  next_number
end

def ends_at_89(cache, fail_cache, number)
  seen_numbers = {number => true}
  return [seen_numbers, false] if fail_cache[number] == true
  return [seen_numbers, true] if cache[number] == true
  while true
    if number == 89
      return [seen_numbers, true]
    elsif number == 1
      return [seen_numbers, false]
    else
      number = next_chain_number(number)
      seen_numbers[number] = true
    end
  end
end

ends_at_89 = 0
limit = 10000000
# limit = 100

cache = Hash.new(false)
fail_cache = Hash.new(false)

(1..limit).each do |num|
  current_result = ends_at_89(cache, fail_cache, num)
  if current_result[1]
    ends_at_89 += 1
    cache = cache.merge(current_result[0].permutations(cache))
  else
    fail_cache = fail_cache.merge(current_result[0].permutations(fail_cache))
  end

  if num % 1000 == 0
    puts "win cache: " + cache.length.to_s + " fail cache: " + fail_cache.length.to_s
  end

  current_result
end

p ends_at_89
