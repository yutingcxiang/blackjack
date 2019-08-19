require 'rspec'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  let(:new_deck) { Deck.new }
  let(:new_deck_suits) { new_deck.cards.map(&:suit) }
  let(:new_deck_values) { new_deck.cards.map(&:value) }

  context 'when Deck is initialized' do
    it 'will have 52 cards' do
      expect(new_deck.cards.count).to eq(52)
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

  let(:drawn_card) { new_deck.draw }

  describe '.draw' do
    it 'will select the first card from the Deck' do
      expect(drawn_card).to eq("ace of diamonds")
    end

    it 'removes first card from deck' do 
      expect(new_deck.cards.include?(drawn_card)).to be(false)
      expect(new_deck.cards.count).to be(51)
    end
  end
end
