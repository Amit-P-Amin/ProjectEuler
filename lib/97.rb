

require_relative '../utility_functions'

(1..100).each do |power|
  puts (2 ** power).to_s[-10..-1]
end
