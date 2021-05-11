class Hand
  attr_accessor :deck

  def initialize
    @deck = []
  end

  def add_card(card)
    @deck << card
  end
  
  def score
    sum = 0
    @deck.each { |card| sum += card.weight_max }
    return sum if sum <= 21
    sum = 0
    @deck.each { |card| sum += card.weight_min }
    sum
  end

  def clear_deck
    @deck = []
  end
end