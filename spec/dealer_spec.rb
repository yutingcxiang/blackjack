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

  describe '#hit_or_stand' do
    it 'hits if max is below 17' do
      expect(new_dealer.calculate_hand).to eql(0)
      new_dealer.hit_or_stand(k_spades)
      expect(new_dealer.calculate_hand).to eql(10)
      new_dealer.hit_or_stand(five_hearts)
      expect(new_dealer.calculate_hand).to eql(15)
      new_dealer.hit_or_stand(seven_hearts)
      expect(new_dealer.calculate_hand).to eql(22)
    end

    it 'stands if max is above or equal to 17' do
      expect(new_dealer.calculate_hand).to eql(0)
      new_dealer.hit_or_stand(a_diamonds)
      expect(new_dealer.calculate_hand).to eql(11)
      new_dealer.hit_or_stand(seven_hearts)
      expect(new_dealer.calculate_hand).to eql(18)
      new_dealer.hit_or_stand(five_hearts)
      expect(new_dealer.calculate_hand).to eql(18)
    end
  end

  describe 'show_hand' do
    it 'will only display the first card in hand' do
      expect(new_dealer.hand[0]).to eql(nil)
      new_dealer.hit(j_hearts)
      expect(new_dealer.hand[0]).to eq(j_hearts)
      new_dealer.hit(a_diamonds)
      expect(new_dealer.hand[0]).to eq(j_hearts)
      new_dealer.hit(six_clubs)
      expect(new_dealer.hand[0]).to eq(j_hearts)
    end
  end
end