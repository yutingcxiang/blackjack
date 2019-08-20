require 'rspec'
require_relative '../lib/card.rb'

RSpec.describe Card do
  let(:first_card) { Card.new('spades', '3') }

  context 'when first card is initialized' do
    it 'will have a suit of spades' do
      expect(first_card.suit).to eql('spades')
    end

    it 'will have a value of 3' do
      expect(first_card.value).to eql('3')
    end
  end

  let(:second_card) { Card.new('diamonds', 'king') }

  context 'when second card is initialized' do
    it 'will have a suit of spades' do
      expect(second_card.suit).to eql('diamonds')
    end

    it 'will have a value of 3' do
      expect(second_card.value).to eql('king')
    end
  end

  describe '#read' do
    it 'prints card value and suit' do
      # expect { second_card.read }.to output("king of diamonds\n").to_stdout
      expect(second_card.read).to eql("king of diamonds")
    end
  end
end
