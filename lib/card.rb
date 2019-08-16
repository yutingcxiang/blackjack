class Card
    attr_reader :suit, :value

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

#     def read
#         puts "#{self.value} of #{self.suit}"
#     end
end