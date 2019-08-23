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

  # describe '#player_turn' do
  #   it 'asks the player for input' do
  #     new_game.player_turn
  #     expect { new_game.player_turn }.to output("What would you like to do?\nHit | Stand | Quit\n").to_stdout
  #   end

  #   before do
  #     allow(new_game).to receive(:gets).and_return("Hit", "Stand", "Quit", "dsfgsdgfs")
  #   end

  #   it 'will give the player another card if Hit is chosen' do
  #     new_game.player_turn
  #     expect(new_game.player_turn).to eql("Hit")
  #     expect(new_game.player.num_cards).not_to eql(0)
  #     expect(new_game.player.calculate_hand).not_to eql(0)
  #   end

  #   it 'will not give the player another card if Stand is chosen' do
  #     # new_game.player_turn
  #     expect(new_game.player_turn).to eql("Stand")
  #     expect(new_game.player.num_cards).to eql(1)
  #   end

  #   it 'will quit the game if Quit is chosen' do
  #     new_game.player_turn
  #   end

  #   it 'will prompt player for another input if choice is invalid' do
  #   end
  # end

  describe '#get_choice' do
    before do
      allow(new_game).to receive(:gets).and_return("Hit", "Stand", "Quit", "dsfgsdgfs")
    end

    it 'asks the player for input' do
      expect { new_game.get_choice }.to output("What would you like to do?\nHit | Stand | Quit\n").to_stdout
    end

    it 'received Hit from player' do
      choice = new_game.get_choice
      expect(choice).to eq('Hit')
      choice = new_game.get_choice
      expect(choice).to eq('Stand')
      choice = new_game.get_choice
      expect(choice).to eq('Quit')
    end

    it 'handles invalid input' do
    end
  end

  describe '#dealer_turn' do
    #automatically plays for dealer
  end

  describe '#play_game' do
    #switches current_player, checks game_over?, ends game with end_game
  end
end