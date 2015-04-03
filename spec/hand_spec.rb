require 'hand'


describe 'Hand' do

  describe 'initialize' do

    it 'should initialize with 5 cards' do
      expect(Hand.new([1,2,3,4,5]).count).to eq(5)
    end
  end
  describe "discard(indices)" do
    let(:hand) { Hand.new([1, 2, 3, 4, 5]) }

    it "should remove cards at the specified indices" do
      hand.discard([1, 3])
      expect(hand.count).to eq(3)
      expect(hand.cards).to eq([1, 3, 5])
    end

    it "should return the cards removed" do
      discarded = hand.discard([1, 3])
      expect(discarded).to eq([2, 4])
    end

  end

  describe "draw(arr)" do
    let(:hand) { Hand.new([1, 2]) }
    it "should add the cards to the hand" do
      hand.draw([3, 4, 5])
      expect(hand.cards).to eq([1, 2, 3, 4, 5])
    end
  end

describe "sort_by_poker_value" do
  let(:hand) do
    Hand.new([Card.new(:hearts,:ace),
              Card.new(:spades,:eight),
              Card.new(:diamonds, :deuce)])
            end

    it 'should sort the hand by poker value' do
      hand.sort_by_poker_value
      expect(hand.card).to eq([Card.new(:hearts,:ace),
                Card.new(:spades,:eight),
                Card.new(:diamonds, :deuce)].reverse)
    end
  end
end
