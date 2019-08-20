class Player
  attr_reader :max, :min
  attr_accessor :hand

  def initialize
    @max = 0
    @min = 0
    @hand = []
  end

  def add_card(card)
    @hand << card
    return @hand
  end
end