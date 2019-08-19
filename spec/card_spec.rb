require 'rspec'
require_relative '../lib/card.rb'

RSpec.describe Card do
  let(:first_card) { Card.new('spades', '3') }

  context 'when first card is initialized' do
    it 'will have a suit of spades' do
      expect(first_card.suit).to eq('spades')
    end

    it 'will have a value of 3' do
      expect(first_card.value).to eq('3')
    end
  end

  let(:second_card) { Card.new('diamonds', 'king') }

  context 'when second card is initialized' do
    it 'will have a suit of spades' do
      expect(second_card.suit).to eq('diamonds')
    end

    it 'will have a value of 3' do
      expect(second_card.value).to eq('king')
    end
  end

  describe '.read' do
    it 'prints card value and suit' do
      expect { second_card.read }.to output("king of diamonds\n").to_stdout
    end
  end
end
