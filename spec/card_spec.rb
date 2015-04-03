require 'card'


describe 'card' do


  describe "Card class methods" do
    let(:suits) { [:hearts, :spades, :diamonds, :clubs].sort}
    let(:values) { [:deuce,:three,:four,:five,:six,:seven,
      :eight,:nine,:ten,:jack,:queen,:king,:ace]}
    it 'should return all suits' do
      expect(Card.suits.sort).to eq(suits)
    end

    it 'should return all values' do
      expect(Card.values).to eq(values)
    end

  end

  describe "Card instance" do

    it "#new should require suit and value" do
      expect { Card.new }.to raise_error #(StandardError)
      expect { Card.new(:hearts, :ace) }.to_not raise_error
    end

    it "should raise an error if given illegal suit/value" do
      expect { Card.new("hello","world") }.to raise_error
    end

    let(:card) { Card.new(:hearts, :ace) }

    it "card#value should return it's value" do
      expect(card.value).to eq(:ace)
    end

    it "card#suit should return it's suit" do
      expect(card.suit).to eq(:hearts)
    end

    it "card#poker_value should return it's actual value" do
      expect(card.poker_value).to eq(14)
    end
  end



end
