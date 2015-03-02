# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.
#
# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49
#
# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
#
# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?

require_relative '../utility_functions'

def ulam_spiral_diagonal_prime_ratio(target_ratio)
  sidelength = 1
  total_diagonals = 1
  primes = 0

  while true
    sidelength += 2
    total_diagonals += 4
    diagonal_number = sidelength ** 2
    (0..3).each do |diagonal|
      primes += 1 if diagonal_number.prime?
      diagonal_number -= sidelength - 1
    end

    ratio = primes.to_f/total_diagonals
    print "prime: " + primes.to_s + " sidelength: " + sidelength.to_s + " ratio: " + ratio.to_s
    puts
    if ratio <= target_ratio
      return sidelength
    end
  end
end

puts ulam_spiral_diagonal_prime_ratio(0.1)
