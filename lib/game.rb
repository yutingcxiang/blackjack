require_relative './card.rb'
require_relative './deck.rb'
require_relative './player.rb'
require_relative './dealer.rb'
# require 'pry'

class Game
  attr_accessor :deck, :player, :dealer, :current_player
  attr_reader :game_over

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @current_player = 'Dealer'
    @game_over = false
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

  def player_turn(choice)
    if choice == "Hit"
      new_card = @deck.deal
      @player.hit(new_card)
    elsif choice == "Stand"
      @player.stand
    elsif choice == "Quit"
      self.quit_game
    else
      self.get_choice
    end
  end

  def get_choice
    puts "What would you like to do?\nHit | Stand | Quit\n"
    player_input = gets.chomp
    return player_input
  end

  def quit_game
    puts "Game Over."
    @game_over = true
    return 
  end

  def switch_player
    @current_player = @current_player == 'Dealer' ? 'Your' : 'Dealer'
  end

end

# binding.pry