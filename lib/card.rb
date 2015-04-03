

class Card
  SUITS = {
    hearts: '♥',
    diamonds: '♦',
    clubs: '♣',
    spades: '♠'
  }

  VALUES = {
    deuce: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }

  def self.values
    VALUES.keys
  end

  def self.suits
    SUITS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    raise ArgumentError "Invalid Suit"  unless Card.suits.include?(suit)
    raise ArgumentError "Invalid Value" unless Card.values.include?(value)
    @suit = suit
    @value = value
  end

  def poker_value
    VALUES[value]
  end
end
