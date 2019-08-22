require 'rspec'
require_relative "../lib/game.rb"
require_relative "../lib/deck.rb"
require_relative "../lib/card.rb"
require_relative "../lib/player.rb"
require_relative "../lib/dealer.rb"

RSpec.describe "Game" do
  let(:new_game) { Game.new }

  context "initializes new game" do
    let(:deck) { Deck.new }
    let(:unshuffled_deck) { deck.cards.dup }
    let(:shuffled_deck) { deck.shuffle }
    let(:dealer) { Dealer.new }
    let(:player) { Player.new }

    it 'initializes both player and dealer with 0 points' do
      expect(player.calculate_hand).to eql(0)
      expect(dealer.calculate_hand).to eql(0)
    end

    it 'initializes both player and dealer with 2 cards in hand' do
      expect(player.num_cards).to eql(0)
      expect(dealer.num_cards).to eql(0)
    end
  end
end