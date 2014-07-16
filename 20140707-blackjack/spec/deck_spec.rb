require_relative '../lib/deck'
require_relative '../lib/card'
require 'humanize'

describe Deck do
  let(:deck) { Deck.new }
  let(:suits) { ['Hearts', 'Spades', 'Clubs', 'Diamonds'] }
  let(:ranks) {  %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace} }
  let(:deck_strings) {
    suits.map { |s| ranks.map { |r| "#{r} of #{s}" } }.flatten
  }

  context 'new' do
    it 'should create new deck with 52 unique cards' do
      available_cards = deck_strings

      deck.cards.each do |card|
        expect(card.class).to eq(Card) # expects that object is a Card
        available_cards -= [card.to_s] # removes card from given array
      end

      expect(available_cards).to be_empty # after removing all cards, it should be empty

    end
  end

  context 'draw' do
    it 'should draw one card from the deck and remove it' do
      card = deck.draw

      expect(card.class).to eq(Card)
      expect(deck.cards.count).to eq(51)
      expect(deck.cards).to_not include(card)
    end

    it 'should draw the amount of cards given as an argument' do
      cards = deck.draw(2)

      expect(cards.class).to eq(Array)
      expect(cards.count).to eq(2)
      expect(deck.cards.count).to eq(50)
    end
  end

end
