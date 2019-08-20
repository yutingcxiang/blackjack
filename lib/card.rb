class Card
  attr_reader :suit, :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def read
    return "#{value} of #{suit}"
  end

  def <=>(other)
    # 1, 0, -1
    suit_scoring = {
      "Diamonds" => 100,
      "Clubs" => 200,
      "Hearts" => 300,
      "Spades" => 400
    }
    
    value_scoring = {
      "A" => 1,
      "J" => 11,
      "Q" => 12,
      "K" => 13
    }

    value_score = value_scoring.fetch(value, value.to_i)
    suit_score = suit_scoring.fetch(suit)

    self_score = value_score + suit_score 

    other_value_score = value_scoring.fetch(other.value, other.value.to_i)
    other_suit_score = suit_scoring.fetch(other.suit)

    other_score = other_value_score + other_suit_score

    self_score <=> other_score
  end
end
