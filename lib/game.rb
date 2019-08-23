require_relative './card.rb'
require_relative './deck.rb'
require_relative './player.rb'
require_relative './dealer.rb'
require 'pry'

class Game
  attr_accessor :deck, :player, :dealer
  attr_reader :current_player, :game_over

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @current_player = 'Dealer'
    @game_over = FALSE
  end

  def setup
    @deck.shuffle

    card1 = @deck.deal
    @player.hit(card1)
    card2 = @deck.deal
    @player.hit(card2)

    card3 = @deck.deal
    @dealer.hit(card3)
    card4 = @deck.deal
    @dealer.hit(card4)
  end

  def player_turn
    puts "What would you like to do?\nHit | Stand | Quit\n"
    player_input = gets.chomp
    
    if player_input == "Hit"
      new_card = @deck.deal
      @player.hit(new_card)
    end
  end
end

# binding.pry