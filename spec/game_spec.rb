require 'rspec'
require_relative "../lib/game.rb"
require_relative "../lib/deck.rb"
require_relative "../lib/card.rb"
require_relative "../lib/player.rb"
require_relative "../lib/dealer.rb"

RSpec.describe "Game" do
  let(:new_game) { Game.new }
  let(:a_diamonds) { Card.new('A', 'Diamonds') } 
  let(:two_diamonds) { Card.new('2', 'Diamonds') } 
  let(:k_spades) { Card.new('K', "Spades") } 
  let(:three_hearts) { Card.new('3', "Hearts") } 
  let(:j_hearts) { Card.new('J', "Hearts") } 
  let(:five_clubs) { Card.new('5', "Clubs") } 
  let(:a_hearts) { Card.new('A', 'Hearts') } 
  let(:q_hearts) { Card.new('Q', 'Hearts') } 

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
    it 'prints a welcome message' do
      expect { new_game.setup }.to output(match("Welcome to Blackjack!")).to_stdout
    end
  end

  describe '#quit_game' do
    it 'will end the game' do
      expect { new_game.quit_game }.to output(match("Game Over.")).to_stdout
    end
  end

  describe '#player_turn' do
    before do
      new_game.player_turn("Hit")
    end
    it 'will give the player another card if Hit is chosen' do
      expect(new_game.player.num_cards).to eql(1)
      expect(new_game.player.calculate_hand).to eql(11)
    end

    before do
      new_game.player_turn("Stand")
    end
    it 'will not give the player another card if Stand is chosen' do
      expect(new_game.player.num_cards).to eql(1)
      expect(new_game.player.calculate_hand).to eql(11)
    end

    before do
      new_game.player_turn("Quit")
    end
    it 'will quit the game if Quit is chosen' do
      expect(new_game.game_over).to be true
    end

    it 'will prompt player for another input if choice is invalid' do
      expect(new_game).to receive(:get_choice)
      new_game.player_turn("What?")
    end
  end

  describe '#get_choice' do
    it 'asks the player for input' do
      expect { new_game.get_choice }.to output("What would you like to do?\nHit | Stand | Quit\n\n").to_stdout
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
    describe "check for victory conditions" do
      context 'player has a score of 21' do
        before do
          new_game.player.hit(a_diamonds)
          new_game.player.hit(k_spades)
          new_game.dealer.hit(five_clubs)
        end
        it 'ends the game' do
          expect(new_game.player.calculate_hand).to eq(21)
          expect{new_game.winner}.to output(match("You win!")).to_stdout
        end
      end

      context 'dealer has a score of 21' do
        before do
          new_game.dealer.hit(a_diamonds)
          new_game.dealer.hit(k_spades)
          new_game.player.hit(five_clubs)
        end
        it 'ends the game' do
          expect(new_game.dealer.calculate_hand).to eq(21)
          expect{new_game.winner}.to output(match("Dealer wins!")).to_stdout
        end
      end

      context 'both dealer and player have scores of 21' do
        before do
          new_game.dealer.hit(a_diamonds)
          new_game.dealer.hit(k_spades)
          new_game.player.hit(a_diamonds)
          new_game.player.hit(k_spades)
        end
        it 'ends the game' do
          expect(new_game.dealer.calculate_hand).to eq(21)
          expect(new_game.player.calculate_hand).to eq(21)
          expect{new_game.winner}.to output(match("Tie game!")).to_stdout
        end
      end

      context 'both dealer and player busts' do
        before do
          new_game.dealer.hit(three_hearts)
          new_game.dealer.hit(k_spades)
          new_game.dealer.hit(q_hearts)
          new_game.player.hit(five_clubs)
          new_game.player.hit(k_spades)
          new_game.player.hit(q_hearts)
        end
        it 'ends the game' do
          expect(new_game.dealer.calculate_hand).to eq(23)
          expect(new_game.player.calculate_hand).to eq(25)
          expect{new_game.winner}.to output(match("No one wins!")).to_stdout
        end
      end
      
      context 'if player has busted' do
        before do
          new_game.player.hit(j_hearts)
          new_game.player.hit(k_spades)
          new_game.player.hit(five_clubs)
        end
        it 'ends the game with dealer as winner' do
          expect(new_game.player.calculate_hand).to eq(25)
          expect{new_game.winner}.to output(match("Dealer wins!")).to_stdout
        end
      end

      context 'if dealer has busted' do
        before do
          new_game.dealer.hit(j_hearts)
          new_game.dealer.hit(k_spades)
          new_game.dealer.hit(five_clubs)
        end
        it 'ends the game with player as winner' do
          expect(new_game.dealer.calculate_hand).to eq(25)
          expect{new_game.winner}.to output(match("You win!")).to_stdout
        end
      end
    end
  end

  describe '#higher_score' do
    describe 'will determine the winner based on the higher current score' do
      context 'player has a higher score' do
        before do
          new_game.player.hit(j_hearts)
          new_game.player.hit(k_spades)
          new_game.dealer.hit(five_clubs)
          new_game.dealer.hit(three_hearts)
        end
        it 'ends the game with player as winner' do
          expect(new_game.player.calculate_hand).to eq(20)
          expect(new_game.dealer.calculate_hand).to eq(8)
          expect{new_game.higher_score}.to output(match("You win!")).to_stdout
        end
      end

      context 'dealer has a higher score' do
        before do
          new_game.dealer.hit(j_hearts)
          new_game.dealer.hit(k_spades)
          new_game.player.hit(five_clubs)
          new_game.player.hit(three_hearts)
        end
        it 'ends the game with dealer as winner' do
          expect(new_game.dealer.calculate_hand).to eq(20)
          expect(new_game.player.calculate_hand).to eq(8)
          expect{new_game.higher_score}.to output(match("Dealer wins!")).to_stdout
        end
      end
    end
  end

  describe '#dealer_turn' do
    context 'will hit or stand depending on score' do
      it 'hits if total is under 17' do
        4.times { new_game.dealer_turn }
        expect(new_game.dealer.calculate_hand).to eql(20)
        expect(new_game.dealer.num_cards).to eql(4)
      end

      it 'stands if max is above or equal to 17' do
        5.times { new_game.dealer_turn }
        expect(new_game.dealer.calculate_hand).to eql(20)
        expect{new_game.dealer_turn}.to output(match("Dealer stands.")).to_stdout
      end
    end
  end

  # describe '#play_game' do
  #   describe "ends game" do
  #   end
    # context 'both player or dealer is standing' do
    #   context 'dealer has a higher score' do
    #     it 'ends the game with dealer as winner' do
    #     end
    #   end
    # end
  # end
end