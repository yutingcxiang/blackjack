require 'rspec'
require_relative "../lib/game.rb"

RSpec.describe "Game" do
  let(:new_game) { Game.new }

  context "initializes new game" do
    #starts with a new deck
    #player and dealer both start with 0 points 
    #player and dealer both start with 2 cards
  end

    #calculate_hand will score the current hand
    #hit deals another card
    #stand holds current hand
    #show_totals displays your hand and the dealer's hand
    #play_dealer draws cards until total is 17 or more
end