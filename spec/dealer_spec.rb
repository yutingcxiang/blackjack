require 'rspec'
require "../lib/dealer.rb"

RSpec.describe 'Dealer' do
  context 'when dealer is initialized' do
    it 'is a subclass of Player' do
    end
  end

  describe '#hit' do
    it 'adds a card to hand if max is below 17' do
    end

    it 'does not add a card to hand if max above or equal to 17' do
    end
  end
end