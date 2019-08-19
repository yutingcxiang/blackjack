class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def read
    return "#{value} of #{suit}"
  end
end
