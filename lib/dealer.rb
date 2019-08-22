require_relative './player.rb'

class Dealer < Player
  def hit_or_stand(card)
    if @max < 17
      self.hit(card)
    else
      self.stand
    end
  end
end