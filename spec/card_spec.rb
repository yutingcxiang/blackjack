require 'rspec'
require_relative '../lib/card.rb'

RSpec.describe Card do
    context "when card is initialized" do
        new_card = Card.new("spades", 3)

        it "will have a suit of spades" do
            expect(new_card.suit).to eq("spades")
        end

        it "will have a value of 3" do
            expect(new_card.value).to eq(3)
        end
    end

end