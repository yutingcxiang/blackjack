require 'rspec'
require_relative "../lib/game.rb"
require_relative "../lib/deck.rb"
require_relative "../lib/card.rb"
require_relative "../lib/player.rb"
require_relative "../lib/dealer.rb"

RSpec.describe "Game" do
  let(:new_game) { Game.new }

  context "initializes new game" do
    it 'initializes a new deck' do
      expect(new_game.deck).to be_an_instance_of Deck
    end

    it 'initializes a new player' do
      expect(new_game.player).to be_an_instance_of Player
    end

    it 'initializes a new dealer' do
      expect(new_game.dealer).to be_an_instance_of Dealer
    end

    it 'initializes with the dealer as current player' do
      expect(new_game.current_player).to eql('Dealer')
    end

    it 'initializes with the game as not over' do
      expect(new_game.game_over).to be false
    end
  end

  describe '#setup' do
    it 'shuffles deck' do
      expect(new_game.deck).to receive(:shuffle)
      new_game.setup
    end

    it 'deals two cards to the player and to the dealer' do
      expect(new_game.player).to receive(:hit).twice
      expect(new_game.dealer).to receive(:hit).twice
      new_game.setup
    end
  end

  describe '#start_game' do
  end

  describe '#game_over?' do
    it 'will end the game if the player or dealer has 21 points' do
    end

    it 'will end the game if both player and dealer stand on the same turn' do
    end

    it 'continues game if the player and dealer have less than 21 points each' do
    end
  end

  describe '#end_game' do
    #close out application
  end

  describe '#player_turn' do
    before do
      allow(new_game).to receive(:gets).and_return("Hit\n")
    end
    #ask player for input
    it 'asks the player for input' do
      expect { new_game.player_turn }.to output("What would you like to do?\nHit | Stand | Quit\n").to_stdout
      expect(new_game.player_turn).to eq("Hit")
    end
  end

  describe '#dealer_turn' do
    #automatically plays for dealer
  end

  describe '#play_game' do
    #switches current_player, checks game_over?, ends game with end_game
  end
end