require 'rspec'
require_relative "../lib/player.rb"

RSpec.describe 'Player' do
  let(:new_player) { Player.new }

  context 'when new player is created' do
    it "will have an empty hand" do
      expect(new_player.hand).to be(nil)
    end
  end

  describe 'total' do
    it 'returns the total value of the hand' do
      expect(new_player.total).to be(0)
    end
  end

end