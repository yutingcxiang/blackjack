require 'spec_helper'
require_relative '../lib/card.rb'

RSpec.describe Card do
  let(:first_card) { Card.new('3', 'Spades') }

  context 'when first card is initialized' do
    it 'will have a suit of spades' do
      expect(first_card.suit).to eql('Spades')
    end

    it 'will have a value of 3' do
      expect(first_card.value).to eql('3')
    end
  end

  let(:second_card) { Card.new("K", 'Diamonds') }

  context 'when second card is initialized' do
    it 'will have a suit of spades' do
      expect(second_card.suit).to eql('Diamonds')
    end

    it 'will have a value of 3' do
      expect(second_card.value).to eql('K')
    end
  end

  describe '#read' do
    it 'prints card value and suit' do
      # expect { second_card.read }.to output("king of diamonds\n").to_stdout
      expect(second_card.read).to eql("| K of Diamonds |")
    end
  end
end
