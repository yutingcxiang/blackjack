require 'rspec'
require_relative '../lib/card.rb'

RSpec.describe Card do
    let!(:new_card) { Card.new("spades", 3) }

    context "when card is initialized" do
        it "will have a suit of spades" do
            expect(new_card.suit).to eq("spades")
        end

        it "will have a value of 3" do
            expect(new_card.value).to eq(3)
        end
    end

    describe ".read" do
        it "prints card value and suit if valid" do
            expect { new_card.read() }.to output("3 of spades\n").to_stdout
        end
    end
end