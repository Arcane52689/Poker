require_relative 'player.rb'

class PokerGame

  attr_accessor :pot
  attr_reader :players, :deck

  def initialize
    @deck = Deck.full_deck
    @players = []
    @pot = 0
  end

  def shuffle
    deck.shuffle!
  end

  def add_player(player)
    players << player
  end

  






end
