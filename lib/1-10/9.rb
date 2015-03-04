# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require_relative '../../utility_functions'

def triple?(a, b, c)
  return true if a ** 2 + b ** 2 == c ** 2
  false
end

def pytho_product(target)
  a = 1
  while true
    b = 1
    while a + b < target
    c = target - a - b
      if triple?(a, b, c)
        puts "a: " + a.to_s + " b: " + b.to_s + " c: " + c.to_s
        return a * b * c
      end
    b += 1
    end

    a += 1
  end
end

p pytho_product(1000)
