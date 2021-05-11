class Character
  attr_accessor :deck, :wallet

  def initialize(money)
    @wallet = money
    @deck = []
  end

  def bet_money(size)
    @wallet -= size
    size
  end

  def score
    sum = 0
    @deck.each { |card| sum += card.weight_max }
    return sum if sum <= 21
    sum = 0
    @deck.each { |card| sum += card.weight_min }
    sum
  end

  def get_money(size)
    @wallet += size
  end

  def add_card(card)
    @deck << card
  end

  def pass
    false
  end

  def out_of_range?
    score > 21
  end

  def clear_deck
    @deck = []
  end
end