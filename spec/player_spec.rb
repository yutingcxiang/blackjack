require 'rspec'
require_relative "../lib/player.rb"
require_relative "../lib/deck.rb"

RSpec.describe 'Player' do
  let(:new_player) { Player.new }
  let(:new_deck) { Deck.new }
  let(:card1) { new_deck.draw }
  let(:card2) { new_deck.draw }

  context 'when new player is created' do
    it "will have an empty hand" do
      expect(new_player.hand).to be_empty
    end

    it 'will have a max of 0' do
      expect(new_player.max).to be(0)
    end

    it 'will have a min of 0' do
      expect(new_player.min).to be(0)
    end
  end

  describe '#draw_card' do
    it 'will draw a card and add it to the hand' do
      new_player.draw_card(card1)
      expect(new_player.hand.count).to eql(1)
    end

    it 'will draw two cards and add them to the hand' do
      new_player.draw_card(card1)
      new_player.draw_card(card2)
      expect(new_player.hand.count).to eql(2)
    end
  end

  describe '#show_hand' do
    it 'displays the value of the cards in hand' do
      new_player.draw_card(card1)
      new_player.draw_card(card2) 
      expect(new_player.show_hand).to eq("| A of Diamonds | 2 of Diamonds |")
    end
  end
end