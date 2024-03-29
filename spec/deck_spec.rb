require 'spec_helper'
require_relative '../lib/deck.rb'
require_relative "../lib/card.rb"

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
      expect(new_deck.cards[0].read).to eql("| A of Diamonds |")
      expect(new_deck.cards[-1].read).to eql("| K of Spades |")
    end
  end

  let(:dealt_card) { new_deck.deal }

  describe '#deal_card' do
    it 'will select the first card from the Deck' do
      expect(dealt_card.read).to eql("| A of Diamonds |")
    end

    it 'removes first card from deck' do 
      expect(new_deck.cards.include?(dealt_card)).to be(false)
      expect(new_deck.num_cards).to be(51)
    end

    it 'does not return card if Deck is empty' do
      empty_deck = Deck.new
      while empty_deck.cards.count > 0 do
        empty_deck.deal
      end
      expect(empty_deck.deal).to eql("Deck empty - no more cards to draw.")
      expect(empty_deck.num_cards).to be(0)
    end
  end

  describe '#shuffle_deck' do
    let(:original_deck) { new_deck.cards.dup }
    let(:shuffled_deck) { new_deck.shuffle }

    it 'will randomize the cards in the Deck' do
      # it has the same cards && the cards are in a different order
      # same_cards && different_order
      same_order = original_deck == shuffled_deck
      original_sorted_cards = original_deck.sort
      shuffled_sorted_cards = shuffled_deck.sort
      same_cards = original_sorted_cards == shuffled_sorted_cards

      expect(same_cards && !same_order).to be(true)
    end

    let(:reshuffled_deck) { new_deck.shuffle }

    it 'will have different cards each time' do
      shuffled_deck_cards = shuffled_deck.dup 
      reshuffled_deck_cards = new_deck.shuffle
      expect(shuffled_deck_cards).not_to eq(reshuffled_deck_cards)
      expect(shuffled_deck_cards).not_to eq(original_deck)
    end
  end

  describe 'reset' do
    let(:original_deck) { new_deck.cards.dup }

    it 'will reset the order of the cards to the initial order' do
      new_deck.shuffle
      expect(new_deck.reset).to eq(original_deck)
    end
  end
end
