require 'deck.rb'

class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def discard(list)
    discarded = list.map do |idx|
      cards[idx]
    end

    discarded.each { |card| cards.delete(card) }
  end

  def draw(new_cards)
    cards.concat(new_cards)
  end

  def sort_by_poker_value

  end
end
