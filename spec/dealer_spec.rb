require 'rspec'
require_relative "../lib/dealer.rb"
require_relative "../lib/player.rb"

RSpec.describe 'Dealer' do
  let!(:new_player) { Player.new }
  let!(:new_dealer) { Dealer.new }

  context 'when dealer is initialized' do
    it 'is a subclass of Player' do
      expect(Dealer).to be < Player
    end
  end

  describe '#hit' do
    it 'adds a card to hand if max is below 17' do
    end

    it 'does not add a card to hand if max above or equal to 17' do
    end
  end
end