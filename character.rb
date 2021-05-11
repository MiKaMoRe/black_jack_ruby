require_relative 'hand'

class Character
  attr_accessor :wallet
  attr_reader :hand

  def initialize(money)
    @wallet = money
    @hand = Hand.new
  end

  def bet_money(size)
    @wallet -= size
    size
  end

  def get_money(size)
    @wallet += size
  end

  def pass
    false
  end

  def out_of_range?
    hand.score > 21
  end
end