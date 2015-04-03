require_relative 'deck.rb'

class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    sort_by_poker_value
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
    cards.sort! { |card1, card2| card1 <=> card2 }
  end

  def flush
    suit = cards.first.suit
    return nil unless cards.all? { |card| card.suit == suit }
    [Hand.new(cards)]
  end

  def straight
    return nil unless cards[0...-1].each_with_index.all? do |el, idx|
      el.poker_value == cards[idx + 1].poker_value - 1
    end

    [Hand.new(cards)]
  end

  def straight_flush
    straight ? flush : nil
  end


  def pair
    0.upto(3) do |idx|
      if cards[idx].same_value?(cards[idx + 1])
        return [Hand.new(cards[idx..idx + 1]), Hand.new(cards.take(idx)+ cards.drop(idx + 2))]
      end
    end

    nil
  end

  def two_pair
    if pair
      return nil unless pair[1].pair
      [pair[0]].concat(pair[1].pair).flatten
    else
      nil
    end
  end

  def three_of_a_kind
    indices = [[0,2],[1,3],[2,4]].select { |(i, j)| cards[i].same_value?(cards[j]) }
    return nil if indices.empty?

    i1, i2 = indices[0]

    new_hand = [Hand.new(cards[i1..i2])]
    dropped_hand = [Hand.new(cards[0...i1] + cards[i2 + 1..4])]

    new_hand + dropped_hand

  end

  def full_house

  end

  def four_of_a_kind
    if cards[0].same_value?(cards[3])
      [Hand.new(cards[0..3]), Hand.new([cards[4]])]
    elsif cards[1].same_value?(cards[4])
      [Hand.new(cards[1..4]), Hand.new([cards[0]])]
    else
      nil
    end
  end





end
