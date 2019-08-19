require 'rspec'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  let(:new_deck) { Deck.new }
  let(:new_deck_suits) { new_deck.cards.map {|card| card.suit} }

  context 'wben Deck is initialized' do
    it 'will have 52 cards' do
      expect(new_deck.cards.count).to eq(52)
    end

    it 'will contain all 4 suits' do
      expect(new_deck_suits).to include('diamonds')
      expect(new_deck_suits).to include('hearts')
      expect(new_deck_suits).to include('spades')
      expect(new_deck_suits).to include('clubs')
    end
  end
    
end
