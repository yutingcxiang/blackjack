class Deck
  SUITS = %w[Diamonds Clubs Hearts Spades]
  VALUES = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

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

  def num_cards
    return @num_cards = @cards.count
  end

  def draw
    if @cards.count == 0 
      return "Deck empty - no more cards to draw."
    else
      first_card = @cards[0]
      @cards.shift
      return first_card
    end
  end

  def shuffle(times)
    @cards.shuffle!(random: Random.new(times))
    return @cards
  end
end
