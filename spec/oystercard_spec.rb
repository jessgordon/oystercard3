require "oystercard"

describe Oystercard do

    it "card should have a balance" do
        card = Oystercard.new
        expect(card.balance).to eq 0
    end
    
end