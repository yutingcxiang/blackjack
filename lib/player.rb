class Player
  attr_reader :max
  attr_accessor :hand

  def initialize
    @max = 0
    @hand = []
  end

  def show_hand
    if @hand.count == 0
      puts "No cards in hand."
    else
      held_cards = ""
      for card in @hand
        held_cards += "#{card.read}"
      end
      puts "Your hand: #{held_cards}"
    end
  end

  def num_cards
    return @hand.count
  end

  def calculate_hand
    @max = 0
    face_cards = %w[J Q K]
    for card in @hand
      if face_cards.include?(card.value)
        @max += 10
      elsif card.value == "A"
        if @max + 11 <= 21
          @max += 11
        else
          @max += 1
        end
      else
        @max += card.value.to_i
      end
    end
    return @max
  end

  def hit(card)
    @hand << card
    self.calculate_hand
  end

  def stand
    puts "Total: #{@max}"
  end
end