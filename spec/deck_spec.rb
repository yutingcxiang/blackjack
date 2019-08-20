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
      expect(new_deck_suits).to include('diamonds')
      expect(new_deck_suits).to include('hearts')
      expect(new_deck_suits).to include('spades')
      expect(new_deck_suits).to include('clubs')
    end

    it 'will contain 13 different values' do
      expect(new_deck_values.uniq.count).to eq(13) 
      expect(new_deck_values).to include('ace')
      expect(new_deck_values).to include('2')
      expect(new_deck_values).to include('3')
      expect(new_deck_values).to include('4')
      expect(new_deck_values).to include('5')
      expect(new_deck_values).to include('6')
      expect(new_deck_values).to include('7')
      expect(new_deck_values).to include('8')
      expect(new_deck_values).to include('9')
      expect(new_deck_values).to include('10')
      expect(new_deck_values).to include('jack')
      expect(new_deck_values).to include('queen')
      expect(new_deck_values).to include('king')
    end

    it 'will create an ordered deck' do
      expect(new_deck.cards[0].read).to eql("ace of diamonds")
      expect(new_deck.cards[-1].read).to eql("king of spades")
    end
  end

  let(:drawn_card) { new_deck.draw }

  describe '#draw_card' do
    it 'will select the first card from the Deck' do
      expect(drawn_card).to eql("ace of diamonds")
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
    it 'will randomize the cards in the Deck' do
      seed = 12
      deck = Deck.new
      original_deck = deck.cards.dup
      deck.shuffle(seed)

      expect(deck.cards).not_to eql(original_deck)
      shuffled_deck = deck.cards.dup

      new_seed = 3
      deck.shuffle(new_seed)
      expect(deck.cards).not_to eql(original_deck)
      expect(deck.cards).not_to eql(shuffled_deck)

      expect(shuffled_deck).to match_array(original_deck)
    end
  end
end
