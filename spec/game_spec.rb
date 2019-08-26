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

  describe '#quit_game' do
    it 'will end the game' do
      new_game.quit_game
      expect(new_game.game_over).to be true
      expect { new_game.quit_game }.to output("Game Over.\n").to_stdout
    end
  end

  describe '#player_turn' do
    it 'will give the player another card if Hit is chosen' do
      new_game.player_turn("Hit")
      expect(new_game.player.num_cards).not_to eql(0)
      expect(new_game.player.calculate_hand).not_to eql(0)
    end

    it 'will not give the player another card if Stand is chosen' do
      new_game.player_turn("Stand")
      expect(new_game.player.num_cards).to eql(0)
      expect(new_game.player.calculate_hand).to eql(0)
    end

    it 'will quit the game if Quit is chosen' do
      new_game.player_turn("Quit")
      expect(new_game.game_over).to be true
    end

    it 'will prompt player for another input if choice is invalid' do
      expect(new_game).to receive(:get_choice)
      new_game.player_turn("What?")
    end
  end

  describe '#get_choice' do
    it 'asks the player for input' do
      expect { new_game.get_choice }.to output("What would you like to do?\nHit | Stand | Quit\n").to_stdout
    end

    before do
      allow(new_game).to receive(:gets).and_return("Hit", "Stand", "Quit", "What?")
    end

    it 'receives a choice from player' do
      expect(new_game.get_choice).to eq('Hit')
      expect(new_game.get_choice).to eq('Stand')
      expect(new_game.get_choice).to eq('Quit')
      expect(new_game.get_choice).to eq('What?')
    end
  end

  describe '#switch_player' do
    context 'if current player is dealer' do
      before :each do
        new_game.switch_player
      end

      it 'switches to human player' do
        expect(new_game.current_player).to eql('Your')
      end
    end

    context 'if you are the current player' do
      before :each do
        new_game.current_player = 'Your'
        new_game.switch_player
      end

      it `switches to dealer's turn` do
        expect(new_game.current_player).to eql('Dealer')
    end

    end
  end

  describe '#play_game' do

    describe "each turn it calculates score for both players" do

    end

    #switches current_player, checks game_over?, ends game with end_game
    describe 'dealer will play on his turn' do
      it 'will hit or stand depending on score' do
        expect(new_game.dealer).to_receive(:hit_or_stand)
      end
    end
  end
end