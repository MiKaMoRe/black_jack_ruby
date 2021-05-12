class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end
  
  def score
    sum = 0
    @cards.each { |card| sum += card.weight_max }
    return sum if sum <= 21
    sum = 0
    @cards.each { |card| sum += card.weight_min }
    sum
  end

  def clear_cards
    @cards = []
  end
end