require_relative './player.rb'

class Dealer < Player
  # def hit_or_stand(card)
  #   if @calculate_hand < 17
  #     self.hit(card)
  #   else
  #     self.stand
  #   end
  # end

  def show_hand
    if @hand.count == 0
      return "No cards in hand."
    else
      first_card = @hand[0]
      first_card_value = "#{first_card.read}"
      puts "Dealer's hand: " + first_card_value
      return first_card_value
    end
  end
end