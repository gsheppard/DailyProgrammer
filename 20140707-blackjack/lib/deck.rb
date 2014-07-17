require_relative './card'

class Deck
  attr_reader :cards

  def initialize
    @cards = (1..52).map { |n| Card.new(id: n) }
  end

  def draw amount=1
    drawn = amount.times.map {|n| @cards.shift }
    drawn.count == 1 ? drawn.first : drawn
  end

  def shuffle times=1
    times.times { |n| @cards.shuffle! }
  end

end
