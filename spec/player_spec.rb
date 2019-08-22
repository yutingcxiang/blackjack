require 'rspec'
require_relative "../lib/player.rb"
require_relative "../lib/card.rb"

RSpec.describe 'Player' do
  let(:new_player) { Player.new }
  let(:new_deck) { Deck.new }
  let(:card1) { Card.new('A', 'Diamonds') } 
  let(:card2) { Card.new('K', "Spades") } 
  let(:card3) { Card.new('3', "Hearts") } 
  let(:card4) { Card.new('J', "Hearts") } 
  let(:card5) { Card.new('5', "Clubs") } 
  let(:card6) { Card.new('A', 'Hearts') } 

  context 'when new player is created' do
    it "will have an empty hand" do
      expect(new_player.hand).to be_empty
    end

    it 'will have a max of 0' do
      expect(new_player.calculate_hand).to be(0)
    end
  end

  describe '#hit' do
    it 'will draw multiple cards and add them to the hand' do
      new_player.hit(card1)
      expect(new_player.hand.count).to eql(1)
      new_player.hit(card2)
      expect(new_player.hand.count).to eql(2)
      new_player.hit(card3)
      expect(new_player.hand.count).to eql(3)
    end
  end

  describe "#stand" do
    it 'returns the current max value' do
      new_player.stand
      expect(new_player.stand).to eql("Max value: 0")
      new_player.hit(card2)
      expect(new_player.stand).to eql("Max value: 10")
    end
  end

  describe '#show_hand' do
    it 'displays the value of the cards in hand' do
      expect(new_player.show_hand).to eql("No cards in hand.")
      new_player.hit(card1)
      expect(new_player.show_hand).to eql("| A of Diamonds |")
      new_player.hit(card2) 
      expect(new_player.show_hand).to eql("| A of Diamonds || K of Spades |")
    end
  end

  describe 'calculate_hand' do
    context 'sums the total value of the cards in hand' do
      it 'correctly sums the value of face cards' do
        expect(new_player.calculate_hand).to eq(0)
        new_player.hit(card2)
        expect(new_player.calculate_hand).to eq(10) 
        new_player.hit(card4)
        expect(new_player.calculate_hand).to eq(20) 
      end

      it 'correctly sums the value of non-face cards' do
        expect(new_player.calculate_hand).to eq(0)
        new_player.hit(card3)
        expect(new_player.calculate_hand).to eq(3) 
        new_player.hit(card5)
        expect(new_player.calculate_hand).to eq(8) 
      end

      it 'correctly sums the value of ace cards' do
        expect(new_player.calculate_hand).to eq(0)
        new_player.hit(card1)
        expect(new_player.calculate_hand).to eq(11) 
        new_player.hit(card6)
        expect(new_player.calculate_hand).to eq(12) 
      end
    end
  end
end