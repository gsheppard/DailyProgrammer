require 'pry'
require 'humanize'

class Card
  attr_reader :rank, :suit

  def initialize params={rank:nil,suit:nil}
    @suit = card_params(params)[:suit]
    @rank = card_params(params)[:rank]
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
    "#{rank_word} of #{@suit}"
  end

  private
  def card_params params
    output = {rank: nil, suit: nil}
    rank_strings = %w{J JACK Q QUEEN K KING A ACE}
    rank_num_to_string = {'11' => 'J', '12' => 'Q', '13' => 'K', '14' => 'A', '1' => 'A'}
    rank_num = (1..14)
    suits = %w{hearts spades clubs diamonds}

    if params[:rank].nil?
      # set rank to random item if param is nil
      output[:rank] = ((2..10).to_a + %w{J Q K A}).sample
    elsif params[:rank].kind_of?(String) && rank_strings.include?(params[:rank].upcase)
      # set rank to given input if it's included in verified set
      output[:rank] = params[:rank][0].upcase
    elsif params[:rank].kind_of?(Integer) && rank_num.include?(params[:rank])
      output[:rank] = params[:rank] if (2..10).to_a.include?(params[:rank])
      output[:rank] = rank_num_to_string[params[:rank].to_s] if params[:rank] == 1 || params[:rank] >= 11 && params[:rank] <= 14
    end

    if params[:suit].nil?
      # set suit to random item if param is nil
      output[:suit] = suits.sample.capitalize
    elsif params[:suit].kind_of?(String) && suits.include?(params[:suit].downcase)
      # set suit to capitalized input if it's included in verified set
      output[:suit] = params[:suit].capitalize
    end

    output
  end

end
