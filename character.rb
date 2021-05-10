class Character
  def initialize(money)
    @wallet = money
    @deck = []
  end

  def bet_money(size)
    @wallet -= size
    return size
  end

  def add_card(card)
    @deck << card
  end

  def pass
    false
  end
end