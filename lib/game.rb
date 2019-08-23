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
    user_input = gets.chomp
  end
end