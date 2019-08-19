class Deck
  SUITS = %w[diamonds hearts spades clubs].freeze
  VALUES = %w[ace 2 3 4 5 6 7 8 9 10 jack queen king].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    for suit in SUITS do
        for value in VALUES do
            card = Card.new(suit, value)
            @cards << card
        end
    end
  end

  # def shuffle
  # end

  # def draw
  # end
end
