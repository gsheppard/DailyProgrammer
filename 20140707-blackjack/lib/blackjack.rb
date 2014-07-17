require_relative './card'
require_relative './deck'

class Blackjack
  attr_reader :players, :status
  attr_accessor :deck

  def initialize players
    names = %w{Doyle Leonora Theda Judson Lisbeth Zoe Salome}

    @players = players.times.map {|n| Player.new(names[n]) }

    @deck = Deck.new
    @deck.shuffle(7)

    @status = true
  end

  def names
    @players.map(&:name)
  end

  def deal
    @players.each { |p| p.hand << deck.draw if p.score < 21 }
  end

  def scores
    output = ""

    @players.each do |player|
      player.hand.each do |card|
        aces = 0
        if card.rank == 'A'
          aces += 1
        elsif %w{J Q K}.include?(card.rank)
          player.score += 10
        elsif card.rank.between?(2,10)
          player.score += card.rank
        end

        if aces > 0
          aces.times do
            if player.score > 10
              player.score += 1
            else
              player.score += 11
            end
          end
        end
      end

      output << "#{player.name}: #{player.score}\n"
    end

    @players.each {|p| self.end if p.score == 21}

    return output
  end

  def shuffle
    @deck.cards.shuffle!
  end

  def end
    @status = false
  end

end

class Player
  attr_reader :name
  attr_accessor :hand, :score

  def initialize name
    @name = name
    @hand = []
    @score = 0
  end

  def to_s
    output = "#{@name}: "

    @hand.each_with_index do |card, i|
      output << "#{card.to_s}"
      output << ", " if i != @hand.length - 1
    end

    return output
  end

end
