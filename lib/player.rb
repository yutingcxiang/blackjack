class Player
  attr_reader :max, :min
  attr_accessor :hand

  def initialize
    @max = 0
    @min = 0
    @hand = []
  end

  def draw_card(card)
    @hand << card
    return @hand
  end

  def show_hand
    held_cards = "|"
    for card in @hand
      held_cards += " #{card.read} |"
    end
    return held_cards
  end
end