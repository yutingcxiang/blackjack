require 'rspec'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  let(:new_deck) { Deck.new }

  context 'wben Deck is initialized' do
    it 'will have 52 cards' do
      expect(new_deck.cards.count).to eq(52)
    end
  end
end
