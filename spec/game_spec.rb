require 'game.rb'

describe "game" do


  describe "Game Initialize" do
    let(:new_game) { PokerGame.new }

    it "should initialize with an empty pot" do
      expect(new_game.pot).to eq(0)
    end

    it "should initialize wiht no players" do
      expect(new_game.players.count).to eq(0)
    end


    it "should initialize with a full deck" do
      expect(new_game.deck.count).to eq(52)
    end

  end

  describe "adding players" do
    let(:new_game) { PokerGame.new }

    it "should add players one at a time" do
      expect {new_game.add_player(1,2,3) }.to raise_error

      new_game.add_player(1)
      expect(new_game.players.count).to eq(1)

      new_game.add_player(2)
      expect(new_game.players.count).to eq(2)
    end


  end



end
