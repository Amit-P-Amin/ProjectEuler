# where each “_” is a single digit.
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,

require_relative '../utility_functions'

def equal_to_answer?(num)
  return false if num.digits != 17

  (1..9).each do |int|
    return false if num.digit(17-((int-1)*2)) != int
  end

  true
end

num = 138902663
while true
  if equal_to_answer?(num*num)
    break
  end
  num -= 2
end

puts num * 10
