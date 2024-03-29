require_relative './card.rb'
require_relative './deck.rb'
require_relative './player.rb'
require_relative './dealer.rb'
# require 'pry'

class Game
  attr_accessor :deck, :player, :dealer, :current_player, :winner
  attr_reader :game_over

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @current_player = 'Your'
    @game_over = false
    @winner = nil
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
    puts
    @dealer.show_first_card
    @player.show_hand
    puts
  end

  def player_turn(choice)
    if choice == "Hit"
      new_card = @deck.deal
      @player.hit(new_card)
      puts
      @player.show_hand
    elsif choice == "Stand"
      @player.stand
      puts
      @player.show_hand
      puts
      self.dealer_turn
      self.higher_score
      self.quit_game
    elsif choice == "Quit"
      puts
      self.dealer_turn
      self.higher_score
      self.quit_game
    else
      puts
      self.get_choice
    end
  end

  def dealer_turn
    if dealer.calculate_hand < 17
      new_card = @deck.deal
      dealer.hit(new_card)
      puts "Dealer hits."
      puts
      @dealer.show_first_card
      puts
    else
      @dealer.stand
      puts
    end
  end

  def get_choice
    puts "What would you like to do?\nHit | Stand | Quit\n"
    puts
    player_input = gets.chomp
    return player_input
  end

  def quit_game
    @game_over = true
    self.print_winner
    puts
    puts "#{@dealer.show_hand}Score: #{@dealer.calculate_hand}"
    puts "#{@player.show_hand}Score: #{@player.calculate_hand}"
    puts
    puts "Game Over."
    puts
    Kernel.exit
  end

  def higher_score
    if @player.calculate_hand > 21 and @dealer.calculate_hand > 21
      @winner = "None"
    elsif @player.calculate_hand > @dealer.calculate_hand
      @winner = "Player"
    elsif @player.calculate_hand < @dealer.calculate_hand
      @winner = "Dealer"
    elsif @player.calculate_hand == @dealer.calculate_hand 
      @winner = "None"
    end
    return @winner
  end

  def determine_winner
    if @player.calculate_hand == 21 and @dealer.calculate_hand == 21
      @winner = "None"
      self.quit_game
    elsif @player.calculate_hand > 21 and @dealer.calculate_hand > 21
      @winner = "None"
      self.quit_game
    elsif @player.calculate_hand == 21
      @winner = "Player"
      self.quit_game
    elsif @dealer.calculate_hand == 21
      @winner = "Dealer"
      self.quit_game
    elsif @dealer.calculate_hand > 21
      @winner = "Player"
      self.quit_game
    elsif @player.calculate_hand > 21
      @winner = "Dealer"
      self.quit_game
    end
  end

  def print_winner
    if @winner == "Player" 
      puts "You win!"
    elsif @winner == "Dealer"
      puts "Dealer wins!"
    else
      puts "Tie Game!"
    end
  end

  def play_game
    puts `clear`
    # self.setup
    while @game_over == false do
      self.determine_winner
      choice = self.get_choice
      until ["Hit", "Stand", "Quit"].include?(choice) do
        choice = self.get_choice
      end
      self.player_turn(choice)
      self.dealer_turn
    end
  end
end

# binding.pry