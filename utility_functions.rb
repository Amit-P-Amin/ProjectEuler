require 'prime'

class Integer
  def factors
    1.upto(Math.sqrt(self)).select {|n| self % n == 0}.inject([]) do |factors, n|
      factors << self/n unless n == self/n
      factors << n
    end.sort
  end

  def prime_factors
    self.factors.select {|n| n.prime?}
  end

  def palindrome?
    self.to_s.palindrome?
  end

  def prime?
    Prime.prime?(self)
  end

  def digits
    Math.log10(self).to_i + 1;
  end

  def digit_sum
    self.to_s.split("").inject(0) { |sum, n| sum += n.to_i}
  end

  def permutations
    self.to_s.chars.to_a.permutation.map(&:join).map(&:to_i).uniq
  end

  def digit(n)
    self.to_s.split(//)[self.digits - n].to_i
  end
end

class Float
  def decimal_to_fraction
    self.to_r.to_s.split("/").map {|s| s.to_i}
  end
end

class String
  def palindrome?
    return true if self == self.reverse
    false
  end
end

class Hash
  def permutations(ignore)
    perms = {}
    self.each do |key, value|
      unless ignore[key]
        perms[key] = true
        key.permutations.each do |perm|
          perms[perm] = true
        end
      end
    end

    perms
  end
end
