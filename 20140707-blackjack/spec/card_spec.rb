require_relative '../lib/card'

describe Card do

  context 'new' do
    let(:rand_card) { Card.new }
    let(:suits) { ['Hearts', 'Spades', 'Clubs', 'Diamonds'] }
    let(:ranks) { (2..10).to_a + %w{J Q K A}}
    let(:rank_num_to_string) { {'11' => 'J', '12' => 'Q', '13' => 'K', '14' => 'A', '1' => 'A'} }


    it 'should create a random valid card when initialized with no parameters' do
      expect(suits).to include(rand_card.suit)
      expect(ranks).to include(rand_card.rank)
    end

    it 'should create a valid card given certain parameters' do
      suits.each do |suit|
        ranks.each do |rank|
          card = Card.new(rank: rank, suit: suit)

          expect(suits).to include(card.suit)
          expect(ranks).to include(card.rank)
        end
      end
    end

    it 'should create a valid card with random suit when given rank' do
      ranks.each do |r|
        rank_card = Card.new(rank: r)

        expect(rank_card.rank).to eq(r)
        expect(suits).to include(rank_card.suit)
      end
    end

    it 'should create a valid card with random rank when given suit' do
      suits.each do |s|
        suit_card = Card.new(suit: s)

        expect(suit_card.suit).to eq(s)
        expect(ranks).to include(suit_card.rank)
      end
    end

    it 'should create a valid card when rank is an integer' do
      14.times do |n|
        n+=1

        card = Card.new(rank: n)

        if n == 1 || n >= 11 && n <= 14
          expect(card.rank).to eq(rank_num_to_string[n.to_s])
        else
          expect(card.rank).to eq(n)
        end
      end

    end

  end

end
