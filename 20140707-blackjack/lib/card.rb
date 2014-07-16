require 'pry'
require 'humanize'

class Card
  attr_reader :rank, :suit

  def initialize params={rank:nil,suit:nil}
    params = card_params(params)
    @suit = params[:suit]
    @rank = params[:rank]
  end

  def to_s
    higher_ranks = {'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace'}

    if @rank.kind_of?(String)
      # if rank is of a higher rank, therefore a string
      rank_word = higher_ranks[@rank]
    else
      # if it's a number, humanize and capitalize it
      rank_word = @rank.humanize.capitalize
    end

    # return formatted string
    "#{rank_word} of #{@suit.capitalize}"
  end

  private
  # Used for sanitizing user input
  def card_params params
    # eventual return value
    output = {rank: nil, suit: nil}

    # for checking different user input
    rank_strings = %w{J JACK Q QUEEN K KING A ACE}
    # for converting integer based ranks from user input to strings
    rank_num_to_string = {'11' => 'J', '12' => 'Q', '13' => 'K', '14' => 'A', '1' => 'A'}
    # full numerical ranks
    rank_num = (1..14)
    suits = %w(SPADES HEARTS CLUBS DIAMONDS)
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

    if !params[:id].nil? && params[:id].between?(1,52)
      # if :id is present and valid, set the suit and rank based on it.
      output[:suit] = suits[params[:id] % 4]
      output[:rank] = ranks[params[:id] % 13]
    else
      if params[:rank].nil?
        # set rank to random item if param is nil
        output[:rank] = ((2..10).to_a + %w{J Q K A}).sample
      elsif params[:rank].kind_of?(String) && rank_strings.include?(params[:rank].upcase)
        # set rank to given input if it's included in verified set
        output[:rank] = params[:rank][0].upcase
      elsif params[:rank].kind_of?(Integer) && rank_num.include?(params[:rank])
        # sets rank to input if between 2 and 10 (non-face cards)
        output[:rank] = params[:rank] if (2..10).to_a.include?(params[:rank])
        # sets rank to input is 1 or >= 11 (Face Cards + Ace)
        output[:rank] = rank_num_to_string[params[:rank].to_s] if params[:rank] == 1 || params[:rank] >= 11 && params[:rank] <= 14
      end

      if params[:suit].nil?
        # set suit to random item if param is nil
        output[:suit] = suits.sample.capitalize
      elsif params[:suit].kind_of?(String) && suits.include?(params[:suit].upcase)
        # set suit to capitalized input if it's included in verified set
        output[:suit] = params[:suit].capitalize
      end

    end

    return output
  end

end
