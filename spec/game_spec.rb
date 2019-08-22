require 'rspec'
require_relative "../lib/game.rb"
require_relative "../lib/deck.rb"
require_relative "../lib/card.rb"
require_relative "../lib/player.rb"
require_relative "../lib/dealer.rb"

RSpec.describe "Game" do
  let(:new_game) { Game.new }

  context "initializes new game" do
    let(:new_game) { Game.new }

    it 'initializes a new deck' do
      expect(new_game.deck).to be_an_instance_of Deck
    end

    it 'initializes a new player' do
      expect(new_game.player).to be_an_instance_of Player
    end

    it 'initializes a new dealer' do
      expect(new_game.dealer).to be_an_instance_of Dealer
    end

    describe '#setup' do
      it 'shuffles deck' do
        expect(new_game.deck).to receive(shuffle)
        new_game.setup
      end

      it 'deals two cards to the player and to the dealer' do
        expect(new_game.player).to receive(hit).twice
        expect(new_game.dealer).to receive(hit).twice
      end

      it 'reveals the first card from the dealer' do
        expect(new_game.dealer).to receive(hit).twice
      end
    end

    # game_over? -> t/f
    # next_turn?
    # current_player
  end
end