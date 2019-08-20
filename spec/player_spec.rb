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

    it 'will have a total of 0' do
      expect(new_player.total).to be(0)
    end
  end

  describe '#score' do
    it 'will calculate the value of the hand' do
    end
  end

end