require 'rspec'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  let(:new_deck) { Deck.new }
  let(:new_deck_suits) { new_deck.cards.map(&:suit) }
  let(:new_deck_values) { new_deck.cards.map(&:value) }

  context 'when Deck is initialized' do
    it 'will have 52 cards' do
      expect(new_deck.num_cards).to eql(52)
    end

    it 'will contain 4 suits' do
      expect(new_deck_suits.uniq.count).to eq(4)
      expect(new_deck_suits).to include('Diamonds')
      expect(new_deck_suits).to include('Hearts')
      expect(new_deck_suits).to include('Spades')
      expect(new_deck_suits).to include('Clubs')
    end

    it 'will contain 13 different values' do
      expect(new_deck_values.uniq.count).to eq(13) 
      expect(new_deck_values).to include('A')
      expect(new_deck_values).to include('2')
      expect(new_deck_values).to include('3')
      expect(new_deck_values).to include('4')
      expect(new_deck_values).to include('5')
      expect(new_deck_values).to include('6')
      expect(new_deck_values).to include('7')
      expect(new_deck_values).to include('8')
      expect(new_deck_values).to include('9')
      expect(new_deck_values).to include('10')
      expect(new_deck_values).to include('J')
      expect(new_deck_values).to include('Q')
      expect(new_deck_values).to include('K')
    end

    it 'will create an ordered deck' do
      expect(new_deck.cards[0].read).to eql("A of Diamonds")
      expect(new_deck.cards[-1].read).to eql("K of Spades")
    end
  end

  let(:drawn_card) { new_deck.draw }

  describe '#draw_card' do
    it 'will select the first card from the Deck' do
      expect(drawn_card.read).to eql("A of Diamonds")
    end

    it 'removes first card from deck' do 
      expect(new_deck.cards.include?(drawn_card)).to be(false)
      expect(new_deck.num_cards).to be(51)
    end

    it 'does not return card if Deck is empty' do
      empty_deck = Deck.new
      while empty_deck.cards.count > 0 do
        empty_deck.draw
      end
      expect(empty_deck.draw).to eql("Deck empty - no more cards to draw.")
      expect(empty_deck.num_cards).to be(0)
    end
  end

  describe '#shuffle_deck' do
    let(:deck) { Deck.new }
    let(:original_deck) { deck.cards.dup }
    let(:shuffled_deck) { deck.shuffle(12) }
    let(:reshuffled_deck) { deck.shuffle(3) }

    it 'will randomize the cards in the Deck' do
      expect(original_deck).not_to eql(shuffled_deck)
      expect(original_deck).not_to eql(reshuffled_deck)
      expect(shuffled_deck).to match_array(original_deck)
    end
  end
end
