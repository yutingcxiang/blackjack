require_relative './player.rb'

class Dealer < Player
  def show_first_card
    if @hand.count == 0
      puts "No cards in hand."
    else
      first_card = @hand[0]
      first_card_value = "#{first_card.read}"
      puts "Dealer's hand: " + first_card_value
      # return first_card_value
    end
  end

  def show_hand
    if @hand.count == 0
      puts "No cards in hand."
    else
      held_cards = ""
      for card in @hand
        held_cards += "#{card.read}"
      end
      puts "Dealer's hand: #{held_cards}"
    end
  end
end