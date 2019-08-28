require 'rspec'
require_relative "../lib/player.rb"
require_relative "../lib/card.rb"

RSpec.describe 'Player' do
  let(:new_player) { Player.new }
  let(:new_deck) { Deck.new }
  let(:a_diamonds) { Card.new('A', 'Diamonds') } 
  let(:k_spades) { Card.new('K', "Spades") } 
  let(:three_hearts) { Card.new('3', "Hearts") } 
  let(:j_hearts) { Card.new('J', "Hearts") } 
  let(:five_clubs) { Card.new('5', "Clubs") } 
  let(:a_hearts) { Card.new('A', 'Hearts') } 

  context 'when new player is created' do
    it "will have an empty hand" do
      expect(new_player.hand).to be_empty
      expect{new_player.show_hand}.to output("No cards in hand.\n").to_stdout
    end

    it 'will have a max of 0' do
      expect(new_player.calculate_hand).to be(0)
      expect(new_player.max).to be(0)
    end
  end

  describe '#hit' do
    it 'will draw multiple cards and add them to the hand' do
      new_player.hit(a_diamonds)
      expect(new_player.hand.count).to eql(1)
      new_player.hit(k_spades)
      expect(new_player.hand.count).to eql(2)
      new_player.hit(three_hearts)
      expect(new_player.hand.count).to eql(3)
    end
  end

  describe "#stand" do
    it 'returns the current max value' do
      new_player.stand
      expect{new_player.stand}.to output("Your Total: 0\n").to_stdout
      new_player.hit(k_spades)
      expect{new_player.stand}.to output("Your Total: 10\n").to_stdout
    end
  end

  describe '#num_cards' do
    it 'displays the number of cards a player has in hand' do
      expect(new_player.num_cards).to eql(0)
      new_player.hit(a_diamonds)
      expect(new_player.num_cards).to eql(1)
      new_player.hit(three_hearts)
      expect(new_player.num_cards).to eql(2)
    end
  end

  describe '#show_hand' do
    it 'displays the value of the cards in hand' do
      expect{new_player.show_hand}.to output("No cards in hand.\n").to_stdout
      new_player.hit(a_diamonds)
      expect{new_player.show_hand}.to output("Your hand: | A of Diamonds |\n").to_stdout
      new_player.hit(k_spades) 
      expect{new_player.show_hand}.to output("Your hand: | A of Diamonds || K of Spades |\n").to_stdout
    end
  end

  describe 'calculate_hand' do
    context 'sums the total value of the cards in hand' do
      it 'correctly sums the value of face cards' do
        expect(new_player.calculate_hand).to eql(0)
        new_player.hit(k_spades)
        expect(new_player.calculate_hand).to eql(10) 
        new_player.hit(j_hearts)
        expect(new_player.calculate_hand).to eql(20) 
      end

      it 'correctly sums the value of non-face cards' do
        expect(new_player.calculate_hand).to eql(0)
        new_player.hit(three_hearts)
        expect(new_player.calculate_hand).to eql(3) 
        new_player.hit(five_clubs)
        expect(new_player.calculate_hand).to eql(8) 
      end

      it 'correctly sums the value of ace cards' do
        expect(new_player.calculate_hand).to eql(0)
        new_player.hit(a_diamonds)
        expect(new_player.calculate_hand).to eql(11) 
        new_player.hit(a_hearts)
        expect(new_player.calculate_hand).to eql(12) 
      end
    end
  end
end