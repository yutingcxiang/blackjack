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
      expect(new_dealer.show_first_card).to eql("No cards in hand.")
      new_dealer.hit(j_hearts)
      expect(new_dealer.show_first_card).to eq(j_hearts.read)
      new_dealer.hit(a_diamonds)
      expect(new_dealer.show_first_card).to eq(j_hearts.read)
      new_dealer.hit(six_clubs)
      expect(new_dealer.show_first_card).to eq(j_hearts.read)
    end
  end
end