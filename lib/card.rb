class Card
  attr_reader :suit, :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def read
    return "#{value} of #{suit}"
  end
end
