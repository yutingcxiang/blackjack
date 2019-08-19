class Deck
  SUITS = %w[diamonds clubs hearts spades].freeze
  VALUES = %w[ace 2 3 4 5 6 7 8 9 10 jack queen king].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        card = Card.new(suit, value)
        @cards << card
      end
    end
  end

  def draw
    if @cards.count == 0 
      return "Deck empty - no more cards to draw"
    else
      first_card = @cards[0]
      @cards.shift()
      return "#{first_card.value} of #{first_card.suit}"
    end
  end

  # def shuffle
  # end
end
