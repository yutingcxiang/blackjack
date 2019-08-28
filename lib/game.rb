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
    @current_player = 'Your'
    @game_over = false
  end

  def setup
    @game_over = false
    @deck.shuffle

    card1 = @deck.deal
    @player.hit(card1)
    card2 = @deck.deal
    @player.hit(card2)

    card3 = @deck.deal
    @dealer.hit(card3)
    card4 = @deck.deal
    @dealer.hit(card4)

    puts "Welcome to Blackjack!"
    puts " "
    @dealer.show_first_card
    @player.show_hand
    puts " "
  end

  def player_turn(choice)
    if choice == "Hit"
      new_card = @deck.deal
      @player.hit(new_card)
      puts " "
      @player.show_hand
    elsif choice == "Stand"
      @player.stand
      puts " "
      @player.show_hand
    elsif choice == "Quit"
      self.quit_game
    else
      self.get_choice
    end
  end

  def dealer_turn
    if dealer.calculate_hand < 17
      new_card = @deck.deal
      dealer.hit(new_card)
      @dealer.show_first_card
    else
      @dealer.stand
    end
  end

  def get_choice
    puts "What would you like to do?\nHit | Stand | Quit\n"
    puts ""
    player_input = gets.chomp
    return player_input
  end

  def quit_game
    @game_over = true
    puts "Game Over."
  end

  # def show_hands_and_totals
  #   puts "Your hand: #{@player.show_hand} - Total: #{@player.calculate_hand}"
  #   puts "Dealer's hand: #{@dealer.show_hand} - Total: #{@dealer.calculate_hand}"
  # end

  def switch_player
    @current_player = @current_player == "Dealer's" ? 'Your' : "Dealer's"
  end

  def winner
    if @player.calculate_hand == 21 and @dealer.calculate_hand == 21
      puts "Tie game!"
    elsif @player.calculate_hand == 21
      puts "You win!"
    elsif @dealer.calculate_hand == 21
      puts "Dealer wins!"
    elsif @dealer.calculate_hand > 21
      puts "You win!"
    elsif @player.calculate_hand > 21
      puts "Dealer wins!"
    end
    if @game_over == true
      if @player.calculate_hand > @dealer.calculate_hand
        puts "You win!"
      elsif @player.calculate_hand < @dealer.calculate_hand
        puts "Dealer wins!"
      elsif @player.calculate_hand == @dealer.calculate_hand
        puts "Tie Game!"
      end
    end
  end

  def play_game
    puts `clear`
    self.setup
    while @game_over == false do
      self.winner
      choice = self.get_choice
      self.player_turn(choice)
      self.switch_player
      self.dealer_turn
    end
  end
end

# binding.pry