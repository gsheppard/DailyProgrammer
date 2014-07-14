# [6/30/2014] Challenge #169 [Easy] 90 Degree 2D Array Rotate
# http://www.reddit.com/r/dailyprogrammer/comments/29i9jw/6302014_challenge_169_easy_90_degree_2d_array/

# Test input
# 1 2 3               7 4 1        9 8 7
# 4 5 6     ->        8 5 2   ->   6 5 4
# 7 8 9  rotate 90    9 6 3   90   3 2 1

class Square
  attr_reader :data

  def initialize data
    @data = data
  end

  def rotate times=1
    rotated = @data
    # because these are all squares, there's no need to rotate more than 4 times
    # Therefore taking the modulus 4 of the input returns the original object.
    (times % 4).times do
      rotated = Square.new(rotated.transpose.map(&:reverse)).data
    end

    Square.new rotated
  end
end

sq_small = [
  %w{1 2 3},
  %w{4 5 6},
  %w{7 8 9}
]

sq_big = [
  %w{1 2 3 4 5 6 7 8 9 0},
  %w{0 9 8 7 6 5 4 3 2 1},
  %w{1 3 5 7 9 2 4 6 8 0},
  %w{0 8 6 4 2 9 7 5 3 1},
  %w{0 1 2 3 4 5 4 3 2 1},
  %w{9 8 7 6 5 6 7 8 9 0},
  %w{1 1 1 1 1 1 1 1 1 1},
  %w{2 2 2 2 2 2 2 2 2 2},
  %w{9 8 7 6 7 8 9 8 7 6},
  %w{0 0 0 0 0 0 0 0 0 0}
]

small = Square.new(sq_small)
big = Square.new(sq_big)
binding.pry
small.rotate
big.rotate
