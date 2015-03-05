# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
#
# How many such routes are there through a 20×20 grid?

require_relative '../../utility_functions'

def paths(n)
  grid = []
  (0..n).each do |row_num|
    row = []
    (0..n).each do |col|
      if col == 0
        row << 1
      elsif row_num == 0
        row << 1
      else
        row << grid[row_num-1][col] + row[col-1]
      end
    end
    grid << row
  end

  grid
end

p paths(20).last.last
