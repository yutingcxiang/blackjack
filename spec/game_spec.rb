require 'rspec'
require_relative "../lib/game.rb"
require_relative "../lib/deck.rb"
require_relative "../lib/card.rb"
require_relative "../lib/player.rb"
require_relative "../lib/dealer.rb"

RSpec.describe "Game" do
  let(:new_game) { Game.new }
  let(:a_diamonds) { Card.new('A', 'Diamonds') } 
  let(:k_spades) { Card.new('K', "Spades") } 
  let(:three_hearts) { Card.new('3', "Hearts") } 
  let(:j_hearts) { Card.new('J', "Hearts") } 
  let(:five_clubs) { Card.new('5', "Clubs") } 
  let(:a_hearts) { Card.new('A', 'Hearts') } 

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
      expect(new_game.current_player).to eql('Your')
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
      expect { new_game.quit_game }.to output("Game Over. Dealer wins!\n").to_stdout
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
        new_game.current_player = "Dealer's"
        new_game.switch_player
      end

      it 'switches to human player' do
        expect(new_game.current_player).to eql("Your")
      end
    end

    context 'if you are the current player' do
      before :each do
        new_game.current_player = 'Your'
        new_game.switch_player
      end

      it `switches to dealer's turn` do
        expect(new_game.current_player).to eql("Dealer's")
    end

    end
  end

  describe '#winner' do
    context 'Tie game' do
      it 'prints Tie game!' do
      expect{new_game.winner('Tie')}.to output("Tie game!\n").to_stdout
      end
    end

    context 'dealer is winner' do
      it 'prints dealer wins' do
        expect{new_game.winner('Dealer')}.to output("Dealer wins!\n").to_stdout
      end
    end

    context 'player is winner' do
      it 'prints you win' do
        expect{new_game.winner('You')}.to output("You win!\n").to_stdout
      end
    end
  end

  describe '#play_game' do
    before :each do
      new_game.player.hit(a_diamonds)
      new_game.player.hit(k_spades)
    end

    describe "check for victory conditions" do
      context 'player has a score of 21' do
        it 'ends the game' do

        end
      end

      context 'dealer has a score of 21' do
        it 'ends the game' do
          #end game
        end
      end
      
      context 'if player has busted' do
        it 'ends the game with dealer as winner' do
        end
      end

      context 'if dealer has busted' do
        it 'ends the game with player as winner' do
        end
      end

      context 'both player or dealer is standing' do
        context 'dealer has a higher score' do
          it 'ends the game with dealer as winner' do
          end
        end

        context 'player has a higher score' do
          it 'ends the game with player as winner' do
          end
        end
      end
    end

    describe 'checks for turn' do
      context "dealer's turn" do
      end

      context "human player's turn" do
      end
    end
  end
end