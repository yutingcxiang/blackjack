require 'rspec'
require_relative "../lib/dealer.rb"
require_relative "../lib/player.rb"

RSpec.describe 'Dealer' do
  let(:new_player) { Player.new }
  let(:new_dealer) { Dealer.new }
  let(:a_diamonds) { Card.new('A', 'Diamonds') } 
  let(:k_spades) { Card.new('K', "Spades") } 
  let(:j_hearts) { Card.new('J', "Hearts") } 
  let(:seven_hearts) { Card.new('7', "Hearts") } 
  let(:six_clubs) { Card.new('6', "Clubs") } 
  let(:five_hearts) { Card.new('5', 'Hearts') } 

  context 'when dealer is initialized' do
    it 'is a subclass of Player' do
      expect(Dealer).to be < Player
    end
  end

  describe 'show_first_card' do
    it 'will only display the first card in hand' do
      expect{new_dealer.show_hand}.to output("No cards in hand.\n").to_stdout
      new_dealer.hit(j_hearts)
      expect{new_dealer.show_first_card}.to output("Dealer's hand: | J of Hearts |\n").to_stdout
      new_dealer.hit(a_diamonds)
      expect{new_dealer.show_first_card}.to output("Dealer's hand: | J of Hearts |\n").to_stdout
      new_dealer.hit(six_clubs)
      expect{new_dealer.show_first_card}.to output("Dealer's hand: | J of Hearts |\n").to_stdout
    end
  end

  describe '#show_hand' do
    it 'displays the value of the cards in hand' do
      expect{new_dealer.show_hand}.to output("No cards in hand.\n").to_stdout
      new_dealer.hit(a_diamonds)
      expect{new_dealer.show_hand}.to output("Dealer's hand: | A of Diamonds |\n").to_stdout
      new_dealer.hit(k_spades) 
      expect{new_dealer.show_hand}.to output("Dealer's hand: | A of Diamonds || K of Spades |\n").to_stdout
    end
  end

  describe "#stand" do
    it 'returns the current max value' do
      new_dealer.stand
      expect{new_dealer.stand}.to output("Dealer's Total: 0\n").to_stdout
      new_dealer.hit(k_spades)
      expect{new_dealer.stand}.to output("Dealer's Total: 10\n").to_stdout
    end
  end
end