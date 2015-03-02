# The 5-digit number, 16807=75, is also a fifth power. Similarly, the 9-digit number, 134217728=89, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?

require_relative '../utility_functions'

count = 0
(0..101).each do |power|
  result = 1
  base = 0
  while result.digits < power + 1
   base += 1
   result = base ** power
   if result.digits == power
     print "base: " + base.to_s + " power: " + power.to_s + " result: " + result.to_s
     puts
     count += 1
   end
 end
end

puts count
