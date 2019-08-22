require 'rspec'
require_relative "../lib/dealer.rb"
require_relative "../lib/player.rb"

RSpec.describe 'Dealer' do
  let(:new_player) { Player.new }
  let(:new_dealer) { Dealer.new }
  let(:card1) { Card.new('A', 'Diamonds') } 
  let(:card2) { Card.new('K', "Spades") } 
  let(:card3) { Card.new('J', "Hearts") } 
  let(:card4) { Card.new('7', "Hearts") } 
  let(:card5) { Card.new('6', "Clubs") } 
  let(:card6) { Card.new('5', 'Hearts') } 

  context 'when dealer is initialized' do
    it 'is a subclass of Player' do
      expect(Dealer).to be < Player
    end
  end

  describe '#hit' do
    it 'adds a card to hand if max is below 17' do
      expect(new_dealer.calculate_hand).to eql(0)
      new_dealer.hit(card2)
      expect(new_dealer.calculate_hand).to eql(10)
      new_dealer.hit(card6)
      expect(new_dealer.calculate_hand).to eql(16)
    end

    it 'does not add a card to hand if max above or equal to 17' do
    end
  end
end