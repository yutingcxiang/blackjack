require 'rspec'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  let(:new_deck) { Deck.new }
  let(:new_deck_suits) { new_deck.cards.map(&:suit) }
  let(:new_deck_values) { new_deck.cards.map(&:value) }

  context 'when Deck is initialized' do
    it 'will have 52 cards' do
      expect(new_deck.num_cards).to eq(52)
    end

    it 'will contain all 4 suits' do
      expect(new_deck_suits).to include('diamonds')
      expect(new_deck_suits).to include('hearts')
      expect(new_deck_suits).to include('spades')
      expect(new_deck_suits).to include('clubs')
    end

    it 'will contain 13 different values' do
      expect(new_deck_values.uniq.count).to eq(13) 
    end
  end

  let(:drawn_card) { new_deck.draw_card }

  describe '.draw_card' do
    it 'will select the first card from the Deck' do
      expect(drawn_card).to eq("ace of diamonds")
    end

    it 'removes first card from deck' do 
      expect(new_deck.cards.include?(drawn_card)).to be(false)
      expect(new_deck.num_cards).to be(51)
    end

    it 'does not return card if Deck is empty' do
      empty_deck = Deck.new
      while empty_deck.cards.count > 0 do
        empty_deck.draw_card
      end
      expect(empty_deck.draw_card).to eq("Deck empty - no more cards to draw.")
    end
  end

  describe '.shuffle_deck' do
    it 'will randomize the cards in the Deck' do
      shuffled_deck = Deck.new
      unshuffled_deck = shuffled_deck.cards.dup
      shuffled_deck.shuffle_deck
      expect(shuffled_deck.cards).to match_array(unshuffled_deck)
      expect(shuffled_deck.cards).not_to eq(unshuffled_deck)
    end
  end
end
